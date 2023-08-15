module SampApi

export Init, SetParam, GetGTACommandLine, IsMenuOpen, ScreenToWorld, WorldToScreen, GetPlayerCPed
export GetPlayerHealth, GetPlayerArmor, GetPlayerMoney, GetPlayerSkinID, GetPlayerInterior
export IsPlayerInAnyVehicle, IsPlayerDriver, IsPlayerPassenger, IsPlayerInInterior
export GetPlayerX, GetPlayerY, GetPlayerZ, GetPlayerPosition, IsPlayerInRange2D, IsPlayerInRange3D
export GetCityName, GetZoneName, TextCreate, TextDestroy, TextSetShadow, TextSetShown
export TextSetColor, TextSetPos, TextSetString, TextUpdate, BoxCreate, BoxDestroy
export BoxSetShown, BoxSetBorder, BoxSetBorderColor, BoxSetColor, BoxSetHeight, BoxSetPos, BoxSetWidth
export LineCreate, LineDestroy, LineSetShown, LineSetColor, LineSetWidth, LineSetPos
export ImageCreate, ImageDestroy, ImageSetShown, ImageSetAlign, ImageSetPos, ImageSetRotation
export DestroyAllVisual, ShowAllVisual, HideAllVisual, GetFrameRate, GetScreenSpecs
export SetCalculationRatio, SetOverlayPriority, SetOverlayCalculationEnabled, GetServerIP
export GetServerPort, SendChat, ShowGameText, AddChatMessage, ShowDialog, GetPlayerNameByID
export GetPlayerIDByName, GetPlayerName, GetPlayerId, IsChatOpen, IsDialogOpen
export GetVehiclePointer, GetVehicleSpeed, GetVehicleHealth, GetVehicleModelId
export GetVehicleModelName, GetVehicleModelNameById, GetVehicleType, GetVehicleFreeSeats
export GetVehicleFirstColor, GetVehicleSecondColor, GetVehicleColor, IsVehicleSeatUsed
export IsVehicleLocked, IsVehicleHornEnabled, IsVehicleSirenEnabled, IsVehicleAlternateSirenEnabled
export IsVehicleEngineEnabled, IsVehicleLightEnabled, IsVehicleCar, IsVehiclePlane
export IsVehicleBoat, IsVehicleTrain, IsVehicleBike, HasWeaponIDClip, GetPlayerWeaponID
export GetPlayerWeaponType, GetPlayerWeaponSlot, GetPlayerWeaponName, GetPlayerWeaponClip
export GetPlayerWeaponTotalClip, GetPlayerWeaponState, GetPlayerWeaponAmmo, GetPlayerWeaponAmmoInClip

const PATH = "SAMPDEV.dll"

const SNDMSG = ccall(("SendChat", PATH), Int32, (Cstring,), stdlib="msvcrt")
const ADDCHATMSG = ccall(("AddChatMessage", PATH), Int32, (Cstring,), stdlib="msvcrt")

function SendChatEx(message::String, args...)
    if !isempty(message)
        if length(args) > 0
            message *= " " * join(" ", args)
        end
        ccall((SNDMSG, PATH), Int32, (Cstring,), message, stdlib="msvcrt")
    end
end

function AddChatMessageEx(text::String)
    AddChatMessageEx(text, "FFFFFF")
end

function AddChatMessageEx(text::String, color::String)
    AddChatMessage("{" * color * "}" * text)
end

end
