---@class bai

require("util")

local icon_scale = tonumber(settings.startup["bai-alert-icon-scale"].value) or 0
local icon_padding = tonumber(settings.startup["bai-alert-icon-padding"].value) or 0
local icon_h_pos = tostring(settings.startup["bai-alert-icon-horizontal-position"].value) or ""
local icon_v_pos = tostring(settings.startup["bai-alert-icon-vertical-position"].value) or ""

bai = {
    tile_size = 32, -- tile size in pixels
    icon_size = 64, -- alert icon size in pixels
    icon_scale = icon_scale
}

-- Get width and height in pixels from selection box
---@param box data.BoundingBox.struct
---@return number, number
bai.get_selection_size = function(box)
    return math.abs(box[2][1] - box[1][1]), math.abs(box[2][2] - box[1][2])
end

-- Calculate pixel shift for icon
---@param size [number, number] -- Pixels
---@param shift [number, number] -- Pixels
---@return [number, number]
bai.get_icon_shift = function(size, shift)
    local width = size[1] * bai.tile_size  -- width in pixels
    local height = size[2] * bai.tile_size -- height in pixels
    local min_size = math.min(width, height)
    local padding = min_size * icon_padding
    local icon_size = bai.icon_scale * bai.icon_size
    local offset = (min_size / 2) - (icon_size / 2) - padding
    local shift_x = 0
    local shift_y = 0

    if icon_h_pos == "left" then
        shift_x = -offset
    elseif icon_h_pos == "right" then
        shift_x = offset
    end

    if icon_v_pos == "top" then
        shift_y = -offset + (shift[2] * bai.icon_scale * 2)
    elseif icon_v_pos == "bottom" then
        shift_y = offset + (shift[2] * bai.icon_scale)
    end

    return util.by_pixel(shift_x, shift_y)
end

-- Updates the alert icon shift for the prototype
---@param prototype data.EntityPrototype
bai.update_alert_icon_shift = function(prototype)
    if icon_h_pos ~= "center" or icon_v_pos ~= "center" then
        local width, height = bai.get_selection_size(prototype.selection_box)
        prototype.alert_icon_shift = bai.get_icon_shift({ width, height }, prototype.alert_icon_shift or { 0, 0 })
    end
end
