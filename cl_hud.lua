surface.CreateFont( "privet", {font = "Arial",extended = true,size = 24,weight = 500,} )
surface.CreateFont( "shadow_privet", {font = "Arial",extended = true,size = 24,weight = 500,blursize=1,} )

local hide = {
	["DarkRP_HUD"] = true,
	["DarkRP_EntityDisplay"] = true,
	["DarkRP_LocalPlayerHUD"] = true,
	["DarkRP_Hungermod"] = true,
	["DarkRP_Agenda"] = false,
	["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
}


hook.Add( "HUDShouldDraw", "HideHUD", function( name )
    if ( hide[ name ] ) then
        return false
    end

hook.Add( "HUDPaint", "simpleHUD", function()

    --Сокращения
    local ply = LocalPlayer()

    local arm = ply:Armor() or 0
    local hp = ply:Health() or 0

    local job = ply:getDarkRPVar( "job" )
    local arrested = ply:getDarkRPVar( "Arrested" )
    local darkrp_name = ply:getDarkRPVar( "rpname" )

    local money = DarkRP.formatMoney( ply:getDarkRPVar( "money" ) )

    --База для худа
    draw.RoundedBox(0, 10, 880.5, 167.5, 10, Color(72, 84, 96, 150))
    draw.RoundedBox(0, 190, 880.5, 167.5, 10, Color(72, 84, 96, 150))

    draw.RoundedBox(0, 10, 880.5, math.Clamp(hp, 0, 100)*1.67, 10, Color(113, 255, 156))
    draw.RoundedBox(0, 190, 880.5, math.Clamp(arm, 0, 100)*1.67, 10, Color(69, 170, 242, 255))

    --Деньги
    surface.SetFont( "privet" )
    local width, height = surface.GetTextSize( job )

    draw.SimpleText(money, "shadow_privet", 20 + width, 853, Color(0, 0, 0))
    draw.SimpleText(money, "privet", 20 + width, 850.5, Color(46, 205, 113))

    --Проффесия
    draw.SimpleText(job, "shadow_privet", 10, 853, Color(0, 0, 0))
    draw.SimpleText(job, "privet", 10, 850.5, Color(255,255,255))

    --Прорисовка арестов
    if arrested == nil then
        return false
    end
    draw.SimpleText(arrested, "shadow_privet", 790, 3.5, Color(0, 0, 0))
    draw.SimpleText(arrested, "privet", 790, 0, Color(255,255,255))

end)
end)