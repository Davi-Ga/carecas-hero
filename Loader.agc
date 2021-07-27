loade_images:
//Load menu images
backdropme=LoadImage("Background 1023x768-Menu.png")
logo_image=loadimage("logo.png")
start_image=loadimage("start.png")
backdrop_image=loadimage("Background.png")


return
//Load sounds
Load_sound:
LoadMusic(1,"musicback.mp3")
return

//Load backdrop
Load_titles:


backspritem=CreateSprite(backdropme)
SetSpritePosition(backspritem,0,0)
SetSpriteDepth(backspritem,200)


backsprite=CreateSprite(backdrop_image)
SetSpritePosition(backsprite,0,0)
SetSpriteDepth(backsprite,200)
SetSpriteVisible(backsprite,0)


//Load Logo
logosprite=CreateSprite(logo_image)
SetSpritePosition(logosprite,150,0)
SetSpriteScale(logosprite,1.5,1.5)
SetSpriteDepth(logosprite,199)





return

//Load Font
Load_menu:
LoadFont(1,"04B_30__.ttf")
CreateText(1,"Start Game")
SetTextSize(1,40)
SetTextFont(1,1)
SetTextPosition(1,360,480)
SetTextColor(1,0,0,0,255)

CreateText(2,"Options")
SetTextSize(2,40)
SetTextFont(2,1)
SetTextPosition(2,410,580)
SetTextColor(2,0,0,0,255)

CreateText(3,"Exit")
SetTextSize(3,40)
SetTextFont(3,1)
SetTextPosition(3,450,680)
SetTextColor(3,0,0,0,255)

return
