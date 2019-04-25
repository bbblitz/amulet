#!/usr/bin/env amulet

local view_type_info = {
    i8 = {
        enumval = "AM_VIEW_TYPE_I8", 
        ctype = "int8_t", 
    },
    u8 = {
        enumval = "AM_VIEW_TYPE_U8", 
        ctype = "uint8_t", 
    },
    i16 = {
        enumval = "AM_VIEW_TYPE_I16", 
        ctype = "int16_t", 
    },
    u16 = {
        enumval = "AM_VIEW_TYPE_U16", 
        ctype = "uint16_t", 
    },
    i32 = {
        enumval = "AM_VIEW_TYPE_I32", 
        ctype = "int32_t", 
    },
    u32 = {
        enumval = "AM_VIEW_TYPE_U32", 
        ctype = "uint32_t", 
    },
    f32 = {
        enumval = "AM_VIEW_TYPE_F32", 
        ctype = "float", 
        vec_ctypes = {
            [1] = "float",
            [2] = "glm::vec2",
            [3] = "glm::vec3", 
            [4] = "glm::vec4",
            [9] = "glm::mat3",
            [16] = "glm::mat4",
        }
    },
    f64 = {
        enumval = "AM_VIEW_TYPE_F64", 
        ctype = "double", 
        vec_ctypes = {
            [1] = "double",
            [2] = "glm::dvec2",
            [3] = "glm::dvec3", 
            [4] = "glm::dvec4",
            [9] = "glm::dmat3",
            [16] = "glm::dmat4",
        }
    },
}

local func_defs = {
    -- basic functions
    { 
        name = "add",
        export = true,
        kind = "component_wise",
        variants = {
            {
                cname = "ADD_OP",
                ret_type = "f32",
                args = {
                    {name = "x", type = "f32"},
                    {name = "y", type = "f32"},
                },
            },
            {
                cname = "ADD_OP",
                ret_type = "f64",
                args = {
                    {name = "x", type = "f64"},
                    {name = "y", type = "f64"},
                },
            },
            {
                cname = "ADD_OP",
                ret_type = "i8",
                args = {
                    {name = "x", type = "i8"},
                    {name = "y", type = "i8"},
                },
            },
            {
                cname = "ADD_OP",
                ret_type = "u8",
                args = {
                    {name = "x", type = "u8"},
                    {name = "y", type = "u8"},
                },
            },
            {
                cname = "ADD_OP",
                ret_type = "i16",
                args = {
                    {name = "x", type = "i16"},
                    {name = "y", type = "i16"},
                },
            },
            {
                cname = "ADD_OP",
                ret_type = "u16",
                args = {
                    {name = "x", type = "u16"},
                    {name = "y", type = "u16"},
                },
            },
            {
                cname = "ADD_OP",
                ret_type = "i32",
                args = {
                    {name = "x", type = "i32"},
                    {name = "y", type = "i32"},
                },
            },
            {
                cname = "ADD_OP",
                ret_type = "u32",
                args = {
                    {name = "x", type = "u32"},
                    {name = "y", type = "u32"},
                },
            },
        }
    },
    { 
        name = "sub",
        export = true,
        kind = "component_wise",
        variants = {
            {
                cname = "SUB_OP",
                ret_type = "f32",
                args = {
                    {name = "x", type = "f32"},
                    {name = "y", type = "f32"},
                },
            },
            {
                cname = "SUB_OP",
                ret_type = "f64",
                args = {
                    {name = "x", type = "f64"},
                    {name = "y", type = "f64"},
                },
            },
            {
                cname = "SUB_OP",
                ret_type = "i8",
                args = {
                    {name = "x", type = "i8"},
                    {name = "y", type = "i8"},
                },
            },
            {
                cname = "SUB_OP",
                ret_type = "u8",
                args = {
                    {name = "x", type = "u8"},
                    {name = "y", type = "u8"},
                },
            },
            {
                cname = "SUB_OP",
                ret_type = "i16",
                args = {
                    {name = "x", type = "i16"},
                    {name = "y", type = "i16"},
                },
            },
            {
                cname = "SUB_OP",
                ret_type = "u16",
                args = {
                    {name = "x", type = "u16"},
                    {name = "y", type = "u16"},
                },
            },
            {
                cname = "SUB_OP",
                ret_type = "i32",
                args = {
                    {name = "x", type = "i32"},
                    {name = "y", type = "i32"},
                },
            },
            {
                cname = "SUB_OP",
                ret_type = "u32",
                args = {
                    {name = "x", type = "u32"},
                    {name = "y", type = "u32"},
                },
            },
        }
    },
    { 
        name = "vec_mul",
        kind = "component_wise",
        variants = {
            {
                cname = "MUL_OP",
                ret_type = "f32",
                args = {
                    {name = "x", type = "f32"},
                    {name = "y", type = "f32"},
                },
            },
            {
                cname = "MUL_OP",
                ret_type = "f64",
                args = {
                    {name = "x", type = "f64"},
                    {name = "y", type = "f64"},
                },
            },
            {
                cname = "MUL_OP",
                ret_type = "i8",
                args = {
                    {name = "x", type = "i8"},
                    {name = "y", type = "i8"},
                },
            },
            {
                cname = "MUL_OP",
                ret_type = "u8",
                args = {
                    {name = "x", type = "u8"},
                    {name = "y", type = "u8"},
                },
            },
            {
                cname = "MUL_OP",
                ret_type = "i16",
                args = {
                    {name = "x", type = "i16"},
                    {name = "y", type = "i16"},
                },
            },
            {
                cname = "MUL_OP",
                ret_type = "u16",
                args = {
                    {name = "x", type = "u16"},
                    {name = "y", type = "u16"},
                },
            },
            {
                cname = "MUL_OP",
                ret_type = "i32",
                args = {
                    {name = "x", type = "i32"},
                    {name = "y", type = "i32"},
                },
            },
            {
                cname = "MUL_OP",
                ret_type = "u32",
                args = {
                    {name = "x", type = "u32"},
                    {name = "y", type = "u32"},
                },
            },
        }
    },
    { 
        name = "div",
        export = true,
        kind = "component_wise",
        variants = {
            {
                cname = "DIV_OP",
                ret_type = "f32",
                args = {
                    {name = "x", type = "f32"},
                    {name = "y", type = "f32"},
                },
            },
            {
                cname = "DIV_OP",
                ret_type = "f64",
                args = {
                    {name = "x", type = "f64"},
                    {name = "y", type = "f64"},
                },
            },
            {
                cname = "DIV_OP",
                ret_type = "i8",
                args = {
                    {name = "x", type = "i8"},
                    {name = "y", type = "i8"},
                },
            },
            {
                cname = "DIV_OP",
                ret_type = "u8",
                args = {
                    {name = "x", type = "u8"},
                    {name = "y", type = "u8"},
                },
            },
            {
                cname = "DIV_OP",
                ret_type = "i16",
                args = {
                    {name = "x", type = "i16"},
                    {name = "y", type = "i16"},
                },
            },
            {
                cname = "DIV_OP",
                ret_type = "u16",
                args = {
                    {name = "x", type = "u16"},
                    {name = "y", type = "u16"},
                },
            },
            {
                cname = "DIV_OP",
                ret_type = "i32",
                args = {
                    {name = "x", type = "i32"},
                    {name = "y", type = "i32"},
                },
            },
            {
                cname = "DIV_OP",
                ret_type = "u32",
                args = {
                    {name = "x", type = "u32"},
                    {name = "y", type = "u32"},
                },
            },
        }
    },
    { 
        name = "mod",
        export = true,
        kind = "component_wise",
        variants = {
            {
                cname = "F32MOD_OP",
                ret_type = "f32",
                args = {
                    {name = "x", type = "f32"},
                    {name = "y", type = "f32"},
                },
            },
            {
                cname = "F64MOD_OP",
                ret_type = "f64",
                args = {
                    {name = "x", type = "f64"},
                    {name = "y", type = "f64"},
                },
            },
            {
                cname = "IMOD_OP",
                ret_type = "i8",
                args = {
                    {name = "x", type = "i8"},
                    {name = "y", type = "i8"},
                },
            },
            {
                cname = "IMOD_OP",
                ret_type = "u8",
                args = {
                    {name = "x", type = "u8"},
                    {name = "y", type = "u8"},
                },
            },
            {
                cname = "IMOD_OP",
                ret_type = "i16",
                args = {
                    {name = "x", type = "i16"},
                    {name = "y", type = "i16"},
                },
            },
            {
                cname = "IMOD_OP",
                ret_type = "u16",
                args = {
                    {name = "x", type = "u16"},
                    {name = "y", type = "u16"},
                },
            },
            {
                cname = "IMOD_OP",
                ret_type = "i32",
                args = {
                    {name = "x", type = "i32"},
                    {name = "y", type = "i32"},
                },
            },
            {
                cname = "IMOD_OP",
                ret_type = "u32",
                args = {
                    {name = "x", type = "u32"},
                    {name = "y", type = "u32"},
                },
            },
        }
    },
    { 
        name = "pow",
        export = true,
        kind = "component_wise",
        variants = {
            {
                cname = "powf",
                ret_type = "f32",
                args = {
                    {name = "x", type = "f32"},
                    {name = "y", type = "f32"},
                },
            },
            {
                cname = "pow",
                ret_type = "f64",
                args = {
                    {name = "x", type = "f64"},
                    {name = "y", type = "f64"},
                },
            },
        }
    },
    { 
        name = "unm",
        export = true,
        kind = "component_wise",
        variants = {
            {
                cname = "UNM_OP",
                ret_type = "f32",
                args = {
                    {name = "x", type = "f32"},
                },
            },
            {
                cname = "UNM_OP",
                ret_type = "f64",
                args = {
                    {name = "x", type = "f64"},
                },
            },
            {
                cname = "UNM_OP",
                ret_type = "i8",
                args = {
                    {name = "x", type = "i8"},
                },
            },
            {
                cname = "UNM_OP",
                ret_type = "u8",
                args = {
                    {name = "x", type = "u8"},
                },
            },
            {
                cname = "UNM_OP",
                ret_type = "i16",
                args = {
                    {name = "x", type = "i16"},
                },
            },
            {
                cname = "UNM_OP",
                ret_type = "u16",
                args = {
                    {name = "x", type = "u16"},
                },
            },
            {
                cname = "UNM_OP",
                ret_type = "i32",
                args = {
                    {name = "x", type = "i32"},
                },
            },
            {
                cname = "UNM_OP",
                ret_type = "u32",
                args = {
                    {name = "x", type = "u32"},
                },
            },
        }
    },

    -- component-wise math functions
    { 
        name = "abs",
        kind = "component_wise",
        variants = {
            {
                cname = "fabsf",
                ret_type = "f32",
                args = {
                    {name = "val", type = "f32"}
                },
            },
            {
                cname = "fabs",
                ret_type = "f64",
                args = {
                    {name = "val", type = "f64"}
                },
            },
        }
    },
    { 
        name = "acos",
        kind = "component_wise",
        variants = {
            {
                cname = "acosf",
                ret_type = "f32",
                args = {
                    {name = "val", type = "f32"}
                },
            },
            {
                cname = "acos",
                ret_type = "f64",
                args = {
                    {name = "val", type = "f64"}
                },
            },
        }
    },
    { 
        name = "asin",
        kind = "component_wise",
        variants = {
            {
                cname = "asinf",
                ret_type = "f32",
                args = {
                    {name = "val", type = "f32"}
                },
            },
            {
                cname = "asin",
                ret_type = "f64",
                args = {
                    {name = "val", type = "f64"}
                },
            },
        }
    },
    { 
        name = "atan",
        kind = "component_wise",
        variants = {
            {
                cname = "atanf",
                ret_type = "f32",
                args = {
                    {name = "val", type = "f32"}
                },
            },
            {
                cname = "atan",
                ret_type = "f64",
                args = {
                    {name = "val", type = "f64"}
                },
            },
        }
    },
    { 
        name = "atan2",
        kind = "component_wise",
        variants = {
            {
                cname = "atan2f",
                ret_type = "f32",
                args = {
                    {name = "y", type = "f32"},
                    {name = "x", type = "f32"},
                },
            },
            {
                cname = "atan2",
                ret_type = "f64",
                args = {
                    {name = "y", type = "f64"},
                    {name = "x", type = "f64"},
                },
            },
        }
    },
    { 
        name = "ceil",
        kind = "component_wise",
        variants = {
            {
                cname = "ceilf",
                ret_type = "f32",
                args = {
                    {name = "val", type = "f32"}
                },
            },
            {
                cname = "ceil",
                ret_type = "f64",
                args = {
                    {name = "val", type = "f64"}
                },
            },
        }
    },
    { 
        name = "cos",
        kind = "component_wise",
        variants = {
            {
                cname = "cosf",
                ret_type = "f32",
                args = {
                    {name = "angle", type = "f32"}
                },
            },
            {
                cname = "cos",
                ret_type = "f64",
                args = {
                    {name = "angle", type = "f64"}
                },
            },
        }
    },
    { 
        name = "floor",
        kind = "component_wise",
        variants = {
            {
                cname = "floorf",
                ret_type = "f32",
                args = {
                    {name = "val", type = "f32"}
                },
            },
            {
                cname = "floor",
                ret_type = "f64",
                args = {
                    {name = "val", type = "f64"}
                },
            },
        }
    },
    { 
        name = "log",
        kind = "component_wise",
        variants = {
            {
                cname = "logf",
                ret_type = "f32",
                args = {
                    {name = "val", type = "f32"}
                },
            },
            {
                cname = "log",
                ret_type = "f64",
                args = {
                    {name = "val", type = "f64"}
                },
            },
        }
    },
    { 
        name = "max",
        kind = "component_wise",
        variants = {
            {
                cname = "am_max",
                ret_type = "f32",
                args = {
                    {name = "a", type = "f32"},
                    {name = "b", type = "f32"},
                },
            },
            {
                cname = "am_max",
                ret_type = "f64",
                args = {
                    {name = "a", type = "f64"},
                    {name = "b", type = "f64"},
                },
            },
        }
    },
    { 
        name = "min",
        kind = "component_wise",
        variants = {
            {
                cname = "am_min",
                ret_type = "f32",
                args = {
                    {name = "a", type = "f32"},
                    {name = "b", type = "f32"},
                },
            },
            {
                cname = "am_min",
                ret_type = "f64",
                args = {
                    {name = "a", type = "f64"},
                    {name = "b", type = "f64"},
                },
            },
        }
    },
    { 
        name = "sin",
        kind = "component_wise",
        variants = {
            {
                cname = "sinf",
                ret_type = "f32",
                args = {
                    {name = "angle", type = "f32"}
                },
            },
            {
                cname = "sin",
                ret_type = "f64",
                args = {
                    {name = "angle", type = "f64"}
                },
            },
        }
    },
    { 
        name = "tan",
        kind = "component_wise",
        variants = {
            {
                cname = "tanf",
                ret_type = "f32",
                args = {
                    {name = "angle", type = "f32"}
                },
            },
            {
                cname = "tan",
                ret_type = "f64",
                args = {
                    {name = "angle", type = "f64"}
                },
            },
        }
    },

    -- element-wise math functions
    {
        name = "vec2",
        kind = "element_wise",
        variants = {
            {
                cname = "glm::vec2",
                ret_type = "f32",
                ret_comps = 2,
                args = {
                    {name = "x", type = "f32", comps = 1},
                    {name = "y", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::vec2",
                ret_type = "f32",
                ret_comps = 2,
                args = {
                    {name = "xy", type = "f32", comps = 2},
                },
            },
            {
                cname = "glm::dvec2",
                ret_type = "f64",
                ret_comps = 2,
                args = {
                    {name = "x", type = "f64", comps = 1},
                    {name = "y", type = "f64", comps = 1},
                },
            },
            {
                cname = "glm::dvec2",
                ret_type = "f64",
                ret_comps = 2,
                args = {
                    {name = "xy", type = "f64", comps = 2},
                },
            },
        }
    },
    {
        name = "vec3",
        kind = "element_wise",
        variants = {
            {
                cname = "glm::vec3",
                ret_type = "f32",
                ret_comps = 3,
                args = {
                    {name = "x", type = "f32", comps = 1},
                    {name = "y", type = "f32", comps = 1},
                    {name = "z", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::vec3",
                ret_type = "f32",
                ret_comps = 3,
                args = {
                    {name = "xy", type = "f32", comps = 2},
                    {name = "z", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::vec3",
                ret_type = "f32",
                ret_comps = 3,
                args = {
                    {name = "x", type = "f32", comps = 1},
                    {name = "yz", type = "f32", comps = 2},
                },
            },
            {
                cname = "glm::vec3",
                ret_type = "f32",
                ret_comps = 3,
                args = {
                    {name = "xyz", type = "f32", comps = 3},
                },
            },
            {
                cname = "glm::dvec3",
                ret_type = "f64",
                ret_comps = 3,
                args = {
                    {name = "x", type = "f64", comps = 1},
                    {name = "y", type = "f64", comps = 1},
                    {name = "z", type = "f64", comps = 1},
                },
            },
            {
                cname = "glm::dvec3",
                ret_type = "f64",
                ret_comps = 3,
                args = {
                    {name = "xy", type = "f64", comps = 2},
                    {name = "z", type = "f64", comps = 1},
                },
            },
            {
                cname = "glm::dvec3",
                ret_type = "f64",
                ret_comps = 3,
                args = {
                    {name = "x", type = "f64", comps = 1},
                    {name = "yz", type = "f64", comps = 2},
                },
            },
            {
                cname = "glm::dvec3",
                ret_type = "f64",
                ret_comps = 3,
                args = {
                    {name = "xyz", type = "f64", comps = 3},
                },
            },
        }
    },
    {
        name = "vec4",
        kind = "element_wise",
        variants = {
            {
                cname = "glm::vec4",
                ret_type = "f32",
                ret_comps = 4,
                args = {
                    {name = "x", type = "f32", comps = 1},
                    {name = "y", type = "f32", comps = 1},
                    {name = "z", type = "f32", comps = 1},
                    {name = "w", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::vec4",
                ret_type = "f32",
                ret_comps = 4,
                args = {
                    {name = "xyz", type = "f32", comps = 3},
                    {name = "w", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::vec4",
                ret_type = "f32",
                ret_comps = 4,
                args = {
                    {name = "x", type = "f32", comps = 1},
                    {name = "yzw", type = "f32", comps = 3},
                },
            },
            {
                cname = "glm::vec4",
                ret_type = "f32",
                ret_comps = 4,
                args = {
                    {name = "xy", type = "f32", comps = 2},
                    {name = "zw", type = "f32", comps = 2},
                },
            },
            {
                cname = "glm::vec4",
                ret_type = "f32",
                ret_comps = 4,
                args = {
                    {name = "x", type = "f32", comps = 1},
                    {name = "y", type = "f32", comps = 1},
                    {name = "zw", type = "f32", comps = 2},
                },
            },
            {
                cname = "glm::vec4",
                ret_type = "f32",
                ret_comps = 4,
                args = {
                    {name = "x", type = "f32", comps = 1},
                    {name = "yz", type = "f32", comps = 2},
                    {name = "w", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::vec4",
                ret_type = "f32",
                ret_comps = 4,
                args = {
                    {name = "xy", type = "f32", comps = 2},
                    {name = "z", type = "f32", comps = 1},
                    {name = "w", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::vec4",
                ret_type = "f32",
                ret_comps = 4,
                args = {
                    {name = "xyzw", type = "f32", comps = 4},
                },
            },
            {
                cname = "glm::dvec4",
                ret_type = "f64",
                ret_comps = 4,
                args = {
                    {name = "x", type = "f64", comps = 1},
                    {name = "y", type = "f64", comps = 1},
                    {name = "z", type = "f64", comps = 1},
                    {name = "w", type = "f64", comps = 1},
                },
            },
            {
                cname = "glm::dvec4",
                ret_type = "f64",
                ret_comps = 4,
                args = {
                    {name = "xyz", type = "f64", comps = 3},
                    {name = "w", type = "f64", comps = 1},
                },
            },
            {
                cname = "glm::dvec4",
                ret_type = "f64",
                ret_comps = 4,
                args = {
                    {name = "x", type = "f64", comps = 1},
                    {name = "yzw", type = "f64", comps = 3},
                },
            },
            {
                cname = "glm::dvec4",
                ret_type = "f64",
                ret_comps = 4,
                args = {
                    {name = "xy", type = "f64", comps = 2},
                    {name = "zw", type = "f64", comps = 2},
                },
            },
            {
                cname = "glm::dvec4",
                ret_type = "f64",
                ret_comps = 4,
                args = {
                    {name = "x", type = "f64", comps = 1},
                    {name = "y", type = "f64", comps = 1},
                    {name = "zw", type = "f64", comps = 2},
                },
            },
            {
                cname = "glm::dvec4",
                ret_type = "f64",
                ret_comps = 4,
                args = {
                    {name = "x", type = "f64", comps = 1},
                    {name = "yz", type = "f64", comps = 2},
                    {name = "w", type = "f64", comps = 1},
                },
            },
            {
                cname = "glm::dvec4",
                ret_type = "f64",
                ret_comps = 4,
                args = {
                    {name = "xy", type = "f64", comps = 2},
                    {name = "z", type = "f64", comps = 1},
                    {name = "w", type = "f64", comps = 1},
                },
            },
            {
                cname = "glm::dvec4",
                ret_type = "f64",
                ret_comps = 4,
                args = {
                    {name = "xyzw", type = "f64", comps = 4},
                },
            },
        }
    },
    {
        name = "mat3",
        kind = "element_wise",
        variants = {
            {
                cname = "glm::mat3",
                ret_type = "f32",
                ret_comps = 9,
                args = {
                    {name = "e1", type = "f32", comps = 1},
                    {name = "e2", type = "f32", comps = 1},
                    {name = "e3", type = "f32", comps = 1},
                    {name = "e4", type = "f32", comps = 1},
                    {name = "e5", type = "f32", comps = 1},
                    {name = "e6", type = "f32", comps = 1},
                    {name = "e7", type = "f32", comps = 1},
                    {name = "e8", type = "f32", comps = 1},
                    {name = "e9", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::mat3",
                ret_type = "f32",
                ret_comps = 9,
                args = {
                    {name = "col1", type = "f32", comps = 3},
                    {name = "col2", type = "f32", comps = 3},
                    {name = "col3", type = "f32", comps = 3},
                },
            },
            {
                cname = "glm::dmat3",
                ret_type = "f64",
                ret_comps = 9,
                args = {
                    {name = "e1", type = "f64", comps = 1},
                    {name = "e2", type = "f64", comps = 1},
                    {name = "e3", type = "f64", comps = 1},
                    {name = "e4", type = "f64", comps = 1},
                    {name = "e5", type = "f64", comps = 1},
                    {name = "e6", type = "f64", comps = 1},
                    {name = "e7", type = "f64", comps = 1},
                    {name = "e8", type = "f64", comps = 1},
                    {name = "e9", type = "f64", comps = 1},
                },
            },
            {
                cname = "glm::dmat3",
                ret_type = "f64",
                ret_comps = 9,
                args = {
                    {name = "col1", type = "f64", comps = 3},
                    {name = "col2", type = "f64", comps = 3},
                    {name = "col3", type = "f64", comps = 3},
                },
            },
        }
    },
    {
        name = "mat4",
        kind = "element_wise",
        variants = {
            {
                cname = "glm::mat4",
                ret_type = "f32",
                ret_comps = 16,
                args = {
                    {name = "e1", type = "f32", comps = 1},
                    {name = "e2", type = "f32", comps = 1},
                    {name = "e3", type = "f32", comps = 1},
                    {name = "e4", type = "f32", comps = 1},
                    {name = "e5", type = "f32", comps = 1},
                    {name = "e6", type = "f32", comps = 1},
                    {name = "e7", type = "f32", comps = 1},
                    {name = "e8", type = "f32", comps = 1},
                    {name = "e9", type = "f32", comps = 1},
                    {name = "e10", type = "f32", comps = 1},
                    {name = "e11", type = "f32", comps = 1},
                    {name = "e12", type = "f32", comps = 1},
                    {name = "e13", type = "f32", comps = 1},
                    {name = "e14", type = "f32", comps = 1},
                    {name = "e15", type = "f32", comps = 1},
                    {name = "e16", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::mat4",
                ret_type = "f32",
                ret_comps = 16,
                args = {
                    {name = "col1", type = "f32", comps = 4},
                    {name = "col2", type = "f32", comps = 4},
                    {name = "col3", type = "f32", comps = 4},
                    {name = "col4", type = "f32", comps = 4},
                },
            },
            {
                cname = "glm::dmat4",
                ret_type = "f64",
                ret_comps = 16,
                args = {
                    {name = "e1", type = "f64", comps = 1},
                    {name = "e2", type = "f64", comps = 1},
                    {name = "e3", type = "f64", comps = 1},
                    {name = "e4", type = "f64", comps = 1},
                    {name = "e5", type = "f64", comps = 1},
                    {name = "e6", type = "f64", comps = 1},
                    {name = "e7", type = "f64", comps = 1},
                    {name = "e8", type = "f64", comps = 1},
                    {name = "e9", type = "f64", comps = 1},
                    {name = "e10", type = "f64", comps = 1},
                    {name = "e11", type = "f64", comps = 1},
                    {name = "e12", type = "f64", comps = 1},
                    {name = "e13", type = "f64", comps = 1},
                    {name = "e14", type = "f64", comps = 1},
                    {name = "e15", type = "f64", comps = 1},
                    {name = "e16", type = "f64", comps = 1},
                },
            },
            {
                cname = "glm::dmat4",
                ret_type = "f64",
                ret_comps = 16,
                args = {
                    {name = "col1", type = "f64", comps = 4},
                    {name = "col2", type = "f64", comps = 4},
                    {name = "col3", type = "f64", comps = 4},
                    {name = "col4", type = "f64", comps = 4},
                },
            },
        }
    },
    {
        name = "mat_mul",
        kind = "element_wise",
        variants = {
            {
                cname = "MAT_MUL",
                ret_type = "f32",
                ret_comps = 16,
                args = {
                    {name = "a", type = "f32", comps = 16},
                    {name = "b", type = "f32", comps = 16},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f32",
                ret_comps = 4,
                args = {
                    {name = "a", type = "f32", comps = 16},
                    {name = "b", type = "f32", comps = 4},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f32",
                ret_comps = 4,
                args = {
                    {name = "a", type = "f32", comps = 4},
                    {name = "b", type = "f32", comps = 16},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f32",
                ret_comps = 16,
                args = {
                    {name = "a", type = "f32", comps = 1},
                    {name = "b", type = "f32", comps = 16},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f32",
                ret_comps = 16,
                args = {
                    {name = "a", type = "f32", comps = 16},
                    {name = "b", type = "f32", comps = 1},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f32",
                ret_comps = 9,
                args = {
                    {name = "a", type = "f32", comps = 9},
                    {name = "b", type = "f32", comps = 9},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f32",
                ret_comps = 3,
                args = {
                    {name = "a", type = "f32", comps = 9},
                    {name = "b", type = "f32", comps = 3},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f32",
                ret_comps = 3,
                args = {
                    {name = "a", type = "f32", comps = 3},
                    {name = "b", type = "f32", comps = 9},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f32",
                ret_comps = 9,
                args = {
                    {name = "a", type = "f32", comps = 1},
                    {name = "b", type = "f32", comps = 9},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f32",
                ret_comps = 9,
                args = {
                    {name = "a", type = "f32", comps = 9},
                    {name = "b", type = "f32", comps = 1},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f64",
                ret_comps = 16,
                args = {
                    {name = "a", type = "f64", comps = 16},
                    {name = "b", type = "f64", comps = 16},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f64",
                ret_comps = 4,
                args = {
                    {name = "a", type = "f64", comps = 16},
                    {name = "b", type = "f64", comps = 4},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f64",
                ret_comps = 4,
                args = {
                    {name = "a", type = "f64", comps = 4},
                    {name = "b", type = "f64", comps = 16},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f64",
                ret_comps = 16,
                args = {
                    {name = "a", type = "f64", comps = 1},
                    {name = "b", type = "f64", comps = 16},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f64",
                ret_comps = 16,
                args = {
                    {name = "a", type = "f64", comps = 16},
                    {name = "b", type = "f64", comps = 1},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f64",
                ret_comps = 9,
                args = {
                    {name = "a", type = "f64", comps = 9},
                    {name = "b", type = "f64", comps = 9},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f64",
                ret_comps = 3,
                args = {
                    {name = "a", type = "f64", comps = 9},
                    {name = "b", type = "f64", comps = 3},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f64",
                ret_comps = 3,
                args = {
                    {name = "a", type = "f64", comps = 3},
                    {name = "b", type = "f64", comps = 9},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f64",
                ret_comps = 9,
                args = {
                    {name = "a", type = "f64", comps = 1},
                    {name = "b", type = "f64", comps = 9},
                },
            },
            {
                cname = "MAT_MUL",
                ret_type = "f64",
                ret_comps = 9,
                args = {
                    {name = "a", type = "f64", comps = 9},
                    {name = "b", type = "f64", comps = 1},
                },
            },
        }
    },
    {
        name = "dot",
        kind = "element_wise",
        variants = {
            {
                cname = "glm::dot",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 2},
                    {name = "y", type = "f32", comps = 2},
                },
            },
            {
                cname = "glm::dot",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 3},
                    {name = "y", type = "f32", comps = 3},
                },
            },
            {
                cname = "glm::dot",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 4},
                    {name = "y", type = "f32", comps = 4},
                },
            },
            {
                cname = "glm::dot",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 2},
                    {name = "y", type = "f64", comps = 2},
                },
            },
            {
                cname = "glm::dot",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 3},
                    {name = "y", type = "f64", comps = 3},
                },
            },
            {
                cname = "glm::dot",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 4},
                    {name = "y", type = "f64", comps = 4},
                },
            },
        }
    },
    {
        name = "perlin",
        kind = "element_wise",
        variants = {
            {
                cname = "PERLIN1_F32",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 2},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 3},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 4},
                },
            },
            {
                cname = "PERLIN2_F32",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 1},
                    {name = "y", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 2},
                    {name = "y", type = "f32", comps = 2},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 3},
                    {name = "y", type = "f32", comps = 3},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 4},
                    {name = "y", type = "f32", comps = 4},
                },
            },
            {
                cname = "PERLIN1_F64",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 1},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 2},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 3},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 4},
                },
            },
            {
                cname = "PERLIN2_F64",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 1},
                    {name = "y", type = "f64", comps = 1},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 2},
                    {name = "y", type = "f64", comps = 2},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 3},
                    {name = "y", type = "f64", comps = 3},
                },
            },
            {
                cname = "glm::perlin",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 4},
                    {name = "y", type = "f64", comps = 4},
                },
            },
        }
    },
    {
        name = "simplex",
        kind = "element_wise",
        variants = {
            {
                cname = "SIMPLEX1_F32",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 1},
                },
            },
            {
                cname = "glm::simplex",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 2},
                },
            },
            {
                cname = "glm::simplex",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 3},
                },
            },
            {
                cname = "glm::simplex",
                ret_type = "f32",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f32", comps = 4},
                },
            },
            {
                cname = "SIMPLEX1_F64",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 1},
                },
            },
            {
                cname = "SIMPLEX2_F64",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 2},
                },
            },
            {
                cname = "SIMPLEX3_F64",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 3},
                },
            },
            {
                cname = "SIMPLEX4_F64",
                ret_type = "f64",
                ret_comps = 1,
                args = {
                    {name = "x", type = "f64", comps = 4},
                },
            },
        }
    },
}

local
function ind(f, n, str)
    if not str then
        str = n
        n = f
    end
    local suf = string.rep("    ", n)
    local pad = str:match("^(%s*)")
    local r = ""
    for line in str:gmatch("([^\n\r]*)\r*\n") do
        r = r..suf..(line:sub(#pad + 1)).."\n"
    end
    if f then
        f:write(r)
    end
    return r
end

local
function keys(t)
    local ks = {}
    local i = 1
    for k, _ in pairs(t) do
        ks[i] = k
        i = i + 1
    end
    return ks
end

local
function get_max_args(func)
    local m = 0
    for _, variant in ipairs(func.variants) do
        if #variant.args > m then
            m = #variant.args
        end
    end
    return m
end

local
function get_arg_types(func, except)
    local types = {}
    for _, variant in ipairs(func.variants) do
        for _, arg in ipairs(variant.args) do
            if arg.type ~= except then
                types[arg.type] = true
            end
        end
    end
    return keys(types)
end

local gen_funcs
local gen_func
local gen_component_wise_func_impl
local gen_component_wise_func_variant
local gen_component_wise_inner_loop
local gen_element_wise_func_impl
local gen_element_wise_func_body
local gen_element_wise_func_variant
local gen_element_wise_case

function gen_funcs(f)
    for _, func in ipairs(func_defs) do
        if func.kind == "component_wise" then
            gen_component_wise_func_impl(f, func)
        elseif func.kind == "element_wise" then
            gen_element_wise_func_impl(f, func)
        else
            error("unknown function kind: "..func.kind)
        end
        gen_func_new(f, func)
        gen_func_into(f, func)
    end
end

function gen_func_new(f, func)
    if not func.export then
        f:write("static ")
    end
    ind(f, 0, [[
int am_mathv_]]..func.name..[[(lua_State *L) {
    return ]]..func.name..[[_impl(L, NULL);
}

]])
end

function gen_func_into(f, func)
    ind(f, 0, [[
static int am_mathv_]]..func.name..[[_into(lua_State *L) {
    am_check_nargs(L, 1);
    am_buffer_view *view = am_check_buffer_view(L, 1);
    lua_pushvalue(L, 1); // return view
    lua_remove(L, 1);
    return ]]..func.name..[[_impl(L, view);
}

]])
end

function gen_element_wise_func_impl(f, func)
    local max_args = get_max_args(func)
    local sig_error = "invalid argument types for function mathv."..func.name
    local return_sig_error = "return luaL_error(L, \""..sig_error.."\");\n"
    local func_decl = "static int "..func.name.."_impl(lua_State *L, am_buffer_view *target) {\n"
    local prelude = [[
        int nargs = lua_gettop(L) - (target == NULL ? 0 : 1);
        if (nargs > ]]..max_args..[[) return luaL_error(L, "too many arguments for mathv.]]..func.name..[[");
        double arg_singleton_vals[]]..max_args..[[][16];
        int arg_count[]]..max_args..[[];
        uint8_t *arg_data[]]..max_args..[[];
        int arg_stride[]]..max_args..[[];
        int arg_components[]]..max_args..[[];
        int arg_type[]]..max_args..[[];
        am_buffer_view_type arg_view_type[]]..max_args..[[];
        for (int i = 0; i < nargs; i++) {
            if (!read_arg(L, i+1, &arg_type[i], &arg_view_type[i], &arg_data[i], &arg_stride[i], &arg_count[i], &arg_components[i], &arg_singleton_vals[i][0])) {
                ]]..return_sig_error..[[
            }
        }
    ]]
    ind(f, 0, func_decl)
    ind(f, 1, prelude)
    gen_element_wise_func_body(f, func)
    ind(f, 1, return_sig_error)
    ind(f, 0, "}\n\n")
end

function gen_component_wise_func_impl(f, func)
    local max_args = get_max_args(func)
    local sig_error = "invalid argument types for function mathv."..func.name
    local return_sig_error = "return luaL_error(L, \""..sig_error.."\");\n"
    local func_decl = "static int "..func.name.."_impl(lua_State *L, am_buffer_view *target) {\n"
    local prelude = [[
        int nargs = lua_gettop(L) - (target == NULL ? 0 : 1);
        uint8_t arg_singleton_scratch[]]..max_args..[[][16*8];
        uint8_t *arg_singleton_bufs[]]..max_args..[[];
        for (int i = 0; i < nargs; i++) {
            arg_singleton_bufs[i] = &arg_singleton_scratch[i][0];
        }
        int arg_count[]]..max_args..[[];
        uint8_t *arg_data[]]..max_args..[[];
        int arg_stride[]]..max_args..[[];
        int arg_components[]]..max_args..[[];
        int arg_type[]]..max_args..[[];
        am_buffer_view_type arg_view_type[]]..max_args..[[];
        am_buffer_view_type output_view_type;
        int output_count;
        int output_components;
        int output_stride;
        uint8_t *output_data;
        bool is_dense;
        component_wise_setup(L, target, "mathv.]]..func.name..[[", nargs, arg_type, arg_view_type, arg_data,
            arg_stride, arg_count, arg_components, arg_singleton_bufs, 
            &output_view_type, &output_count, &output_components, &output_stride, &output_data, &is_dense);
    ]]
    ind(f, 0, func_decl)
    ind(f, 1, prelude)
    for _, variant in ipairs(func.variants) do
        gen_component_wise_func_variant(f, func, variant)
    end
    ind(f, 1, return_sig_error)
    ind(f, 0, "}\n\n")
end

function gen_return_view_buffer(f, component_size, ret_view_type)
    ind(f, 2, [[
        uint8_t *output_ptr;
        int out_stride;
        if (target == NULL) {
            // create a new buffer for the output
            out_stride = output_components * ]]..component_size..[[;

            am_buffer *output_buffer = am_push_new_buffer_and_init(L, count * output_components * ]]..component_size..[[);
            output_ptr = output_buffer->data;
            am_buffer_view *output_view = am_new_buffer_view(L, ]]..ret_view_type..[[, output_components);
            output_view->buffer = output_buffer;
            output_view->buffer_ref = output_view->ref(L, -2);
            output_view->offset = 0;
            output_view->stride = out_stride;
            output_view->size = count;
            output_view->last_max_elem_version = 0;
            output_view->max_elem = 0;

            lua_remove(L, -2); // remove output_buffer
        } else {
            // overwrite provided buffer
            if (target->type != ]]..ret_view_type..[[) {
                return luaL_error(L, "target view has incorrect type (expecting %s, got %s)",
                    am_view_type_infos[]]..ret_view_type..[[].name, am_view_type_infos[target->type].name);
            }
            if (target->components != output_components) {
                return luaL_error(L, "target view has incorrect number of components (expecting %d, got %d)",
                    output_components, target->components);
            }
            count = am_min(count, target->size);
            target->mark_dirty(0, count);
            out_stride = target->stride;
            output_ptr = target->buffer->data + target->offset;
        }
    ]])
end

function gen_component_wise_func_variant(f, func, variant)
    local args = variant.args
    local nargs = #args
    local ret_view_type = view_type_info[variant.ret_type].enumval
    local sig_test = "nargs == "..nargs.." && output_view_type == "..ret_view_type

    ind(f, 1, "if ("..sig_test..") {\n")
    gen_component_wise_inner_loop(f, func, variant)
    ind(f, 2, "return 1;\n")
    ind(f, 1, "}\n")
end

function gen_component_wise_inner_loop(f, func, variant)
    local ret_ctype = view_type_info[variant.ret_type].ctype
    local component_size = "sizeof("..ret_ctype..")"
    local setup_dense_arg_arrays = ""
    local setup_nondense_pointers = ""
    local advance_nondense_pointers = ""
    local dense_call_args = ""
    local nondense_call_args = ""
    for a, arg in ipairs(variant.args) do
        local arg_array_decl = ret_ctype.." *arg"..a.."_arr = ("..ret_ctype.."*)arg_data["..(a-1).."];\n        "
        setup_dense_arg_arrays = setup_dense_arg_arrays..arg_array_decl
        local arg_ptr_decl = "uint8_t *arg"..a.."_ptr = arg_data["..(a-1).."];\n        "..
            "int arg"..a.."_stride = arg_stride["..(a-1).."];\n        "..
            "int mask"..a.." = arg_components["..(a-1).."] == 1 ? 0 : 0xFFFF;        "
        setup_nondense_pointers = setup_nondense_pointers..arg_ptr_decl
        local advance = "arg"..a.."_ptr += arg"..a.."_stride;\n            "
        advance_nondense_pointers = advance_nondense_pointers..advance;
        dense_call_args = dense_call_args.."arg"..a.."_arr[i]"
        nondense_call_args = nondense_call_args.."(("..ret_ctype.."*)arg"..a.."_ptr)[c & mask"..a.."]"
        if a < #variant.args then
            dense_call_args = dense_call_args..", "
            nondense_call_args = nondense_call_args..", "
        end
    end
    local loop = [[
    if (is_dense) {
        ]]..ret_ctype..[[ *out_arr = (]]..ret_ctype..[[*)output_data;
        ]]..setup_dense_arg_arrays..[[

        for (int i = 0; i < output_count * output_components; ++i) {
            out_arr[i] = ]]..variant.cname..[[(]]..dense_call_args..[[);
        }
    } else {
        ]]..setup_nondense_pointers..[[

        for (int i = 0; i < output_count; ++i) {
            for (int c = 0; c < output_components; ++c) {
                ((]]..ret_ctype..[[*)output_data)[c] = ]]..variant.cname..[[(]]..nondense_call_args..[[);
            }
            output_data += output_stride;
            ]]..advance_nondense_pointers..[[

        }
    }
    ]]
    ind(f, 2, loop)
end

function gen_element_wise_func_body(f, func)
    local check_zero_args = [[
        // code below depends on there being at least one arg
        if (nargs == 0) return luaL_error(L, "no arguments given for mathv.]]..func.name..[[");
    ]]

    local compute_count = [[
        // compute count
        int count = -1;
        for (int i = 0; i < nargs; i++) {
            if (arg_type[i] == MT_am_buffer_view) {
                if (count != -1 && arg_count[i] != count) {
                    return luaL_error(L, "in call to mathv.]]..func.name..[[ argument %d has size %d, but previous arguments have size %d", (i+1), arg_count[i], count);
                } else if (count == -1) {
                    count = arg_count[i];
                }
            }
        }
        bool no_view_args = false;
        if (count == -1) {
            no_view_args = true;
            count = 1;
        }
    ]]

    ind(f, 1, check_zero_args)
    ind(f, 1, compute_count)

    for _, variant in ipairs(func.variants) do
        gen_element_wise_func_variant(f, func, variant)
    end
end

function gen_element_wise_func_variant(f, func, variant)
    local args = variant.args
    local nargs = #args
    local sig_test = "nargs == "..nargs.." "
    for ii, arg in ipairs(args) do
        local i = ii-1
        local enumval = view_type_info[arg.type].enumval
        sig_test = sig_test.." && arg_components["..i.."] == "..arg.comps..
            " && ((arg_type["..i.."] == MT_am_buffer_view && arg_view_type["..i.."] == "..enumval..") || "..
            "arg_type["..i.."] != MT_am_buffer_view)"
    end

    local setup_non_view_arg_data = "// setup non-view args\n"
    for ii, arg in ipairs(args) do
        local i = ii-1
        local setup = [[
if (arg_type[]]..i..[[] != MT_am_buffer_view) {
    double *f64s = &arg_singleton_vals[]]..i..[[][0];
]]
        if arg.type ~= "f64" then
            -- convert doubles to required type, overwriting the doubles
            -- (a little messy, but should be fine, because the required type will be smaller or
            -- of equal size and we don't need the doubles anymore)
            local ctype = view_type_info[arg.type].ctype
            setup = setup..[[
    ]]..ctype..[[ *conv = (]]..ctype..[[*)f64s;
    for (int i = 0; i < arg_components[]]..i..[[]; i++) {
        conv[i] = (]]..ctype..[[)f64s[i];
    }
]]
      end
        setup = setup..[[
    arg_data[]]..i..[[] = (uint8_t*)f64s;
}
]]

        setup_non_view_arg_data = setup_non_view_arg_data..setup
    end

    local ret_components = variant.ret_comps
    local ret_ctype = view_type_info[variant.ret_type].ctype
    local ret_view_type = view_type_info[variant.ret_type].enumval
    local ret_compsize = "sizeof("..ret_ctype..")"

    local setup_pointers = ""
    for a, arg in ipairs(variant.args) do
        local comp_size = "sizeof("..view_type_info[arg.type].ctype..")"
        setup_pointers = setup_pointers..[[
int in_stride_]]..a..[[ = arg_stride[]]..(a-1)..[[];
uint8_t *in_ptr_]]..a..[[ = &arg_data[]]..(a-1)..[[][0];
]]
    end

    out_ctype_vec = view_type_info[variant.ret_type].vec_ctypes[variant.ret_comps]
    local iterate = [[
for (int i = 0; i < count; ++i) {
    *((]]..out_ctype_vec..[[*)output_ptr) = ]]..variant.cname..[[(]]
    for a, arg in ipairs(variant.args) do
        local ctype = view_type_info[arg.type].vec_ctypes[arg.comps]
        iterate = iterate.."*(("..ctype.."*)in_ptr_"..a..")"
        if a < #variant.args then
            iterate = iterate..", "
        end
    end
    iterate = iterate..");\n"
    for a, arg in ipairs(variant.args) do
        iterate = iterate.."    in_ptr_"..a.." += in_stride_"..a..";\n"
    end
    iterate = iterate.."    output_ptr += out_stride;\n";
    iterate = iterate.."}\n"

    ind(f, 1, "if ("..sig_test..") {\n")
    ind(f, 2, setup_non_view_arg_data)
    ind(f, 2, "int output_components = "..ret_components..";\n")
    gen_return_view_buffer(f, ret_compsize, ret_view_type)
    ind(f, 2, setup_pointers)
    ind(f, 2, iterate)
    ind(f, 2, "return 1;\n")
    ind(f, 1, "}\n")
end

local
function gen_open_module_func(f)
    f:write([[
void am_open_mathv_module(lua_State *L) {
    luaL_Reg vfuncs[] = {
        {"range",   am_mathv_range},
        {"random",  am_mathv_random},
        {"cart",    am_mathv_cart},
        {"mul",     am_mathv_mul},
]])
    for _, func in ipairs(func_defs) do
        f:write("        {\""..func.name.."\", am_mathv_"..func.name.."},\n")
    end
    f:write([[
        {NULL, NULL}
    };
    am_open_module(L, "mathv", vfuncs);
}
]])
end

local
function gen_register_view_methods_func(f)
    f:write([[
void am_register_mathv_view_methods(lua_State *L) {
    lua_pushcclosure(L, am_mathv_add, 0);
    lua_setfield(L, -2, "__add");
    lua_pushcclosure(L, am_mathv_sub, 0);
    lua_setfield(L, -2, "__sub");
    lua_pushcclosure(L, am_mathv_mul, 0);
    lua_setfield(L, -2, "__mul");
    lua_pushcclosure(L, am_mathv_div, 0);
    lua_setfield(L, -2, "__div");
    lua_pushcclosure(L, am_mathv_mod, 0);
    lua_setfield(L, -2, "__mod");
    lua_pushcclosure(L, am_mathv_pow, 0);
    lua_setfield(L, -2, "__pow");
    lua_pushcclosure(L, am_mathv_unm, 0);
    lua_setfield(L, -2, "__unm");
]])
    for _, func in ipairs(func_defs) do
        f:write([[
    lua_pushcclosure(L, am_mathv_]]..func.name..[[_into, 0);
    lua_setfield(L, -2, "]]..func.name..[[");
]])
    end
    f:write([[
}

]])
end

function gen_func_headers(f)
    for _, func in ipairs(func_defs) do
        f:write("int am_mathv_"..func.name.."(lua_State *L);\n")
    end
end

local
function gen_cpp_file()
    local f = io.open("src/am_mathv.cpp", "w")
    ind(f, 0, [[
// This file is generated by tools/gen_mathv.lua

#include "amulet.h"
#include "am_mathv_helper.inc"

]])
    gen_funcs(f)
    gen_register_view_methods_func(f)
    gen_open_module_func(f)
    f:close()
end

gen_cpp_file()
