require("better-alert-icons")

-- Adjust the global scale of alert icons
local utility_constants = data.raw["utility-constants"].default
utility_constants.default_alert_icon_scale = bai.icon_scale

for category_name, category in pairs(data.raw) do
    for prototype_name, prototype in pairs(category) do
        if prototype.selection_box and not bai.update_alert_icon_shift(prototype) then
            log(("better-alert-icons: skipping invalid selection_box for %s/%s")
                :format(category_name, prototype_name))
        end
    end
end
