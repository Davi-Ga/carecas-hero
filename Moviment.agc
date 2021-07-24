load_moviment:

//Create Sprite2
CreateSprite(2,0)

//Sprite Position 2
CarecaX=150
CarecaY=675

CarecaRight=0
CarecaLeft=0
Speed=3


//Sprite Animation 2
/*AddSpriteAnimationFrame(2,LoadImage("Careca-parado.png"))
AddSpriteAnimationFrame(2,LoadImage("Careca-andando1.png"))
AddSpriteAnimationFrame(2,LoadImage("Careca-andando2.png"))
PlaySprite(2,10,1,1,3)
SetSpriteVisible(2,0)*/



//Create Sprite 20
CreateSprite(20,0)

//Sprite Animation 20
AddSpriteAnimationFrame(20,LoadImage("Careca-soco1.png"))
AddSpriteAnimationFrame(20,LoadImage("Careca-soco2.png"))
//AddSpriteAnimationFrame(20,LoadImage("Soco3.png"))
AddSpriteAnimationFrame(20,LoadImage("Careca-soco4.png"))
SetSpriteVisible(20,0)
PlaySprite(20,7,1,1,3)


//Bullet Sprites
LoadImage(5,"Soco.png")
LoadImage(6,"Soco-Esquerda.png")


type Bullet
	Active
	BulletX
	BulletY
endtype

type BulletLeft
	ActiveLeft
	BulletLeft_X
	BulletLeft_Y
endtype

dim all_bullets[3] as Bullet


for b=0 to 3
	CreateSprite(3+b,5)
	SetSpriteVisible(3+b,0)
next b

dim all_bullets2[3] as BulletLeft

for b2=0 to 3
	CreateSprite(7+b2,6)
	SetSpriteVisible(7+b2,0)
next b2		

return
