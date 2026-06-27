data:extend({
    {
        type = "double-setting",
        name = "bai-alert-icon-scale",
        setting_type = "startup",
        minimum_value = 0.0,
        maximum_value = 1.0,
        default_value = 0.35,
        order = "a"
    },
    {
        type = "double-setting",
        name = "bai-alert-icon-padding",
        setting_type = "startup",
        minimum_value = 0.0,
        maximum_value = 0.3,
        default_value = 0.1,
        order = "b"
    },
    {
        type = "string-setting",
        name = "bai-alert-icon-horizontal-position",
        setting_type = "startup",
        default_value = "center",
        allowed_values = {
            "left",
            "center",
            "right",
        },
        order = "c"
    },
    {
        type = "string-setting",
        name = "bai-alert-icon-vertical-position",
        setting_type = "startup",
        default_value = "center",
        allowed_values = {
            "top",
            "center",
            "bottom",
        },
        order = "d"
    }
})
