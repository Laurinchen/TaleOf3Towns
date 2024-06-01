require("Annotations");

---@cast UI UI

---@param t table<CheckBox, boolean>
local function radio(t)
    for button, bool in pairs(t) do
        button.SetIsChecked(bool);
    end
end



---Client_PresentConfigureUI hook
---@param rootParent RootParent
function Client_PresentConfigureUI(rootParent)
    ---@type Label
    local UILabel = UI.CreateLabel(rootParent)
        .SetText("Select template used");
    ---@type CheckBox
    UI9PlayerTemplate = UI.CreateCheckBox(rootParent)
        .SetText("9 Players");
    ---@type CheckBox
    UI18PlayerTemplate = UI.CreateCheckBox(rootParent)
        .SetText("18 Players")

    UI9PlayerTemplate.SetOnValueChanged(
        function()
            radio({
                UI9PlayerTemplate = true;
                UI18PlayerTemplate = false;
            });
        end
    )

    UI18PlayerTemplate.SetOnValueChanged(
        function()
            radio({
                UI9PlayerTemplate = false;
                UI18PlayerTemplate = true;
            });
        end
    )

    UI9PlayerTemplate.SetIsChecked(true);
end
