require("Annotations");

---@enum PlayerAmount
local PlayerAmount = {
    Amount9 = 0,
    Amount18 = 1
}

---@cast Mod Mod

---Client_SaveConfigureUI hook
---@param alert fun(message: string) # Alert the player that something is wrong, for example, when a setting is not configured correctly. When invoked, cancels the player from saving and returning
function Client_SaveConfigureUI(alert)
    
    if UI18PlayerTemplate.GetIsChecked() then
        Mod.Settings = {
            PlayerAmount = PlayerAmount.Amount9
        };
    else
        alert("18 Player mode isn't supported yet");
    end
end