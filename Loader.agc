//Load menu images
loade_images:
backdropme=LoadImage("Background 1023x768-Menu.png")
logo_image=loadimage("logo.png")
start_image=loadimage("start.png")
backdrop_image=loadimage("Background.png")

return

//Load sounds
Load_sound:
LoadMusic(1,"Undertale OST_ 068 - Death by Glamour_160k.mp3")
LoadMusic(6,"musicback.mp3")


LoadSound(2,"Shoot_01.wav")
LoadSound(3,"Jump_03.wav")
LoadSound(4,"Hit_02.wav")


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

CreateText(4,"Score: ")
SetTextSize(4,30)
SetTextFont(4,1)
SetTextPosition(4,20,10)
SetTextColor(4,0,0,0,255)
SetTextVisible(4,0)

CreateText(5,"Back")
SetTextSize(5,30)
SetTextFont(5,1)
SetTextPosition(5,20,720)
SetTextColor(5,0,0,0,255)
SetTextVisible(5,0)

CreateText(6,"Created by: Davi Galdino de Oliveira Souza")
SetTextSize(6,30)
SetTextFont(6,1)
SetTextPosition(6,20,220)
SetTextColor(6,0,0,0,255)
SetTextVisible(6,0)



return
