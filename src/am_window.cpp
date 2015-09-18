#include "amulet.h"

#define DEFAULT_WIN_WIDTH 640
#define DEFAULT_WIN_HEIGHT 480

static std::vector<am_window*> windows;

static int create_window(lua_State *L) {
    am_check_nargs(L, 1);
    if (!lua_istable(L, 1)) return luaL_error(L, "expecting a table in position 1");
    am_window_mode mode = AM_WINDOW_MODE_WINDOWED;
    am_display_orientation orientation = AM_DISPLAY_ORIENTATION_ANY;
    int top = -1;
    int left = -1;
    int requested_width = DEFAULT_WIN_WIDTH;
    int requested_height = DEFAULT_WIN_HEIGHT;
    const char *title = "Untitled";
    bool resizable = true;
    bool highdpi = false;
    bool borderless = false;
    bool depth_buffer = false;
    bool stencil_buffer = false;
    glm::vec4 clear_color(0.0f, 0.0f, 0.0f, 1.0f);
    bool lock_pointer = false;
    int msaa_samples = 0;

    lua_pushnil(L);
    while (lua_next(L, 1) != 0) {
        const char *key = luaL_checkstring(L, -2);
        if (strcmp(key, "mode") == 0) {
            mode = am_get_enum(L, am_window_mode, -1);
        } else if (strcmp(key, "orientation") == 0) {
            orientation = am_get_enum(L, am_display_orientation, -1);
        } else if (strcmp(key, "top") == 0) {
            top = luaL_checkinteger(L, -1);
        } else if (strcmp(key, "left") == 0) {
            left = luaL_checkinteger(L, -1);
        } else if (strcmp(key, "width") == 0) {
            requested_width = luaL_checkinteger(L, -1);
            if (requested_width <= 0) {
                return luaL_error(L, "width must be positive");
            }
        } else if (strcmp(key, "height") == 0) {
            requested_height = luaL_checkinteger(L, -1);
            if (requested_height <= 0) {
                return luaL_error(L, "height must be positive");
            }
        } else if (strcmp(key, "title") == 0) {
            title = luaL_checkstring(L, -1);
        } else if (strcmp(key, "highdpi") == 0) {
            highdpi = lua_toboolean(L, -1);
        } else if (strcmp(key, "resizable") == 0) {
            resizable = lua_toboolean(L, -1);
        } else if (strcmp(key, "borderless") == 0) {
            borderless = lua_toboolean(L, -1);
        } else if (strcmp(key, "depth_buffer") == 0) {
            depth_buffer = lua_toboolean(L, -1);
        } else if (strcmp(key, "stencil_buffer") == 0) {
            stencil_buffer = lua_toboolean(L, -1);
        } else if (strcmp(key, "lock_pointer") == 0) {
            lock_pointer = lua_toboolean(L, -1);
        } else if (strcmp(key, "msaa_samples") == 0) {
            msaa_samples = luaL_checkinteger(L, -1);
            if (msaa_samples < 0) {
                return luaL_error(L, "msaa_samples can't be negative");
            }
        } else if (strcmp(key, "clear_color") == 0) {
            clear_color = am_get_userdata(L, am_vec4, -1)->v;
        } else {
            return luaL_error(L, "unrecognised window setting: '%s'", key);
        }
        lua_pop(L, 1); // pop value
    }
    am_window *win = am_new_userdata(L, am_window);
    win->needs_closing = false;
    win->requested_width = requested_width;
    win->requested_height = requested_height;
    win->native_win = am_create_native_window(
        mode,
        orientation,
        top, left,
        requested_width, requested_height,
        title,
        highdpi,
        resizable,
        borderless,
        depth_buffer,
        stencil_buffer,
        msaa_samples);
    win->clear_color = clear_color;
    if (win->native_win == NULL) {
        return luaL_error(L, "unable to create native window");
    }
    am_get_native_window_size(win->native_win, &win->pwidth, &win->pheight);

    win->scene = NULL;
    win->scene_ref = LUA_NOREF;

    win->has_depth_buffer = depth_buffer;
    win->has_stencil_buffer = stencil_buffer;

    win->lock_pointer = lock_pointer;
    am_set_native_window_lock_pointer(win->native_win, lock_pointer);
    win->mode = mode;
    win->dirty = false;

    lua_rawgeti(L, LUA_REGISTRYINDEX, AM_WINDOW_TABLE);
    lua_pushvalue(L, -2);
    win->window_ref = luaL_ref(L, -2);
    lua_pop(L, 1); // window table

    windows.push_back(win);

    win->pushuservalue(L);
    lua_newtable(L);
    lua_setfield(L, -2, "_event_data");
    lua_pop(L, 1); // uservalue

    lua_pushvalue(L, -1);
    am_call_amulet(L, "_init_window_event_data", 1, 0);

    return 1;
}

am_window* am_find_window(am_native_window *nwin) {
    for (unsigned int i = 0; i < windows.size(); i++) {
        am_window *win = windows[i];
        if (win->native_win == nwin) {
            return win;
        }
    }
    return NULL;
}

void am_handle_window_close(am_native_window *nwin) {
    am_window *win = am_find_window(nwin);
    if (win != NULL) {
        win->needs_closing = true;
    }
}

static int close_window(lua_State *L) {
#if defined(AM_BACKEND_EMSCRIPTEN)
    // closing the window only stops the program running, which
    // just looks like it's crashed to the user.
    return 0;
#else
    am_check_nargs(L, 1);
    am_window *win = am_get_userdata(L, am_window, 1);
    if (win->needs_closing) {
        return 0; // window already closed
    }
    win->needs_closing = true;
    return 0;
#endif
}

static void close_windows(lua_State *L) {
    unsigned int i = 0;
    while (i < windows.size()) {
        am_window *win = windows[i];
        if (win->needs_closing) {
            am_destroy_native_window(win->native_win);
            win->native_win = NULL;
            win->needs_closing = false;
            lua_rawgeti(L, LUA_REGISTRYINDEX, AM_WINDOW_TABLE);
            luaL_unref(L, -1, win->window_ref);
            lua_pop(L, 1); // window table
            win->window_ref = LUA_NOREF;
            windows.erase(windows.begin() + i);
            continue;
        }
        i++;
    }
}

void am_destroy_windows(lua_State *L) {
    for (unsigned int i = 0; i < windows.size(); i++) {
        am_window *win = windows[i];
        win->needs_closing = true;
    }
    close_windows(L);
}

static void update_window_sizes() {
    for (unsigned int i = 0; i < windows.size(); i++) {
        am_window *win = windows[i];
        if (win->dirty) {
            am_set_native_window_size_and_mode(win->native_win, win->requested_width, win->requested_height, win->mode);
            win->dirty = false;
        }
    }
}

static void draw_windows() {
    for (unsigned int i = 0; i < windows.size(); i++) {
        am_window *win = windows[i];
        if (!win->needs_closing) {
            am_native_window_pre_render(win->native_win);
            am_render_state *rstate = &am_global_render_state;
            am_get_native_window_size(win->native_win, &win->pwidth, &win->pheight);
            glm::vec4 cc = win->clear_color;
            am_set_framebuffer_clear_color(cc.r, cc.g, cc.b, cc.a);
            rstate->do_render(win->scene, 0, true, win->pwidth, win->pheight, win->has_depth_buffer);
            am_native_window_post_render(win->native_win);
        }
    }
}

bool am_update_windows(lua_State *L) {
    static unsigned int frame = 0;
    close_windows(L);
    update_window_sizes();
    draw_windows();
    frame++;
    if (am_conf_log_gl_calls) {
        am_debug("GL: ===================== END FRAME %d ==========================", frame);
    }
    return windows.size() > 0;
}

bool am_execute_actions(lua_State *L, double dt) {
    am_pre_frame(L, dt);
    unsigned int n = windows.size();
    bool res = true;
    for (unsigned int i = 0; i < n; i++) {
        am_window *win = windows[i];
        if (!win->needs_closing && win->scene != NULL) {
            if (!am_execute_node_actions(L, win->scene)) {
                res = false;
                break;
            }
            win->push(L);
            am_call_amulet(L, "_clear_events", 1, 0);
        }
    }
    am_post_frame(L);
    return res;
}

static void get_scene(lua_State *L, void *obj) {
    am_window *window = (am_window*)obj;
    window->pushref(L, window->scene_ref);
}

static void set_scene(lua_State *L, void *obj) {
    am_window *window = (am_window*)obj;
    if (lua_isnil(L, 3)) {
        if (window->scene == NULL) return;
        window->unref(L, window->scene_ref);
        window->scene_ref = LUA_NOREF;
        window->scene = NULL;
        return;
    }
    window->scene = am_get_userdata(L, am_scene_node, 3);
    if (window->scene_ref == LUA_NOREF) {
        window->scene_ref = window->ref(L, 3);
    } else {
        window->reref(L, window->scene_ref, 3);
    }
}

static am_property scene_property = {get_scene, set_scene};

static void get_window_pwidth(lua_State *L, void *obj) {
    am_window *window = (am_window*)obj;
    lua_pushinteger(L, am_max(1, window->pwidth));
}

static void get_window_pheight(lua_State *L, void *obj) {
    am_window *window = (am_window*)obj;
    lua_pushinteger(L, am_max(1, window->pheight));
}

static am_property pwidth_property = {get_window_pwidth, NULL};
static am_property pheight_property = {get_window_pheight, NULL};

static void get_lock_pointer(lua_State *L, void *obj) {
    am_window *window = (am_window*)obj;
    lua_pushboolean(L, window->lock_pointer);
}

static void set_lock_pointer(lua_State *L, void *obj) {
    am_window *window = (am_window*)obj;
    bool value = lua_toboolean(L, 3);
    am_set_native_window_lock_pointer(window->native_win, value);
    window->lock_pointer = value;
}

static am_property lock_pointer_property = {get_lock_pointer, set_lock_pointer};

static void get_window_mode(lua_State *L, void *obj) {
    am_window *window = (am_window*)obj;
    am_push_enum(L, am_window_mode, window->mode);
}

static void set_window_mode(lua_State *L, void *obj) {
    am_window *window = (am_window*)obj;
    am_window_mode old_mode = window->mode;
    am_window_mode new_mode = am_get_enum(L, am_window_mode, 3);
    if (old_mode != new_mode) {
        window->mode = new_mode;
        window->dirty = true;
    }
}

static am_property window_mode_property = {get_window_mode, set_window_mode};

static void get_clear_color(lua_State *L, void *obj) {
    am_window *win = (am_window*)obj;
    am_new_userdata(L, am_vec4)->v = win->clear_color;
}
static void set_clear_color(lua_State *L, void *obj) {
    am_window *win = (am_window*)obj;
    win->clear_color = am_get_userdata(L, am_vec4, 3)->v;
}

static am_property clear_color_property = {get_clear_color, set_clear_color};

static void register_window_mt(lua_State *L) {
    lua_newtable(L);

    am_set_default_index_func(L);
    am_set_default_newindex_func(L);

    am_register_property(L, "scene", &scene_property);
    am_register_property(L, "lock_pointer", &lock_pointer_property);
    am_register_property(L, "width", &pwidth_property);
    am_register_property(L, "height", &pheight_property);
    am_register_property(L, "mode", &window_mode_property);
    am_register_property(L, "clear_color", &clear_color_property);

    lua_pushcclosure(L, close_window, 0);
    lua_setfield(L, -2, "close");

    am_register_metatable(L, "window", MT_am_window, 0);
}

void am_open_window_module(lua_State *L) {
    luaL_Reg funcs[] = {
        {"window",    create_window},
        {NULL, NULL}
    };
    am_open_module(L, AMULET_LUA_MODULE_NAME, funcs);
    register_window_mt(L);

    am_enum_value window_mode_enum[] = {
        {"windowed",        AM_WINDOW_MODE_WINDOWED},
        {"fullscreen",      AM_WINDOW_MODE_FULLSCREEN_DESKTOP},
        {"real-fullscreen", AM_WINDOW_MODE_FULLSCREEN},
        {NULL, 0}
    };
    am_register_enum(L, ENUM_am_window_mode, window_mode_enum);

    am_enum_value orientation_enum[] = {
        {"portrait",    AM_DISPLAY_ORIENTATION_PORTRAIT},
        {"landscape",   AM_DISPLAY_ORIENTATION_LANDSCAPE},
        {"any",         AM_DISPLAY_ORIENTATION_ANY},
        {NULL, 0}
    };
    am_register_enum(L, ENUM_am_display_orientation, orientation_enum);

    lua_newtable(L);
    lua_rawseti(L, LUA_REGISTRYINDEX, AM_WINDOW_TABLE);

    windows.clear();
}
