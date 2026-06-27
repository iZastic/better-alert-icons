require("better-alert-icons")

-- Adjust the global scale of alert icons
local utility_constants = data.raw["utility-constants"].default
utility_constants.default_alert_icon_scale = bai.icon_scale

for _, category in pairs(data.raw) do
    for _, prototype in pairs(category) do
        if prototype.selection_box then
            bai.update_alert_icon_shift(prototype)
        end
    end
end
