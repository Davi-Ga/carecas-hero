load_moviment:

//Create Sprite Walking
CreateSprite(2,0)

//Sprite Position Walking
CarecaX=150
CarecaY=675

CarecaRight=0
CarecaLeft=0
Speed=4


//Create Sprite Punching
CreateSprite(20,0)

//Sprite Animation Punching
AddSpriteAnimationFrame(20,LoadImage("Careca-soco1.png"))
AddSpriteAnimationFrame(20,LoadImage("Careca-soco2.png"))
AddSpriteAnimationFrame(20,LoadImage("Careca-soco4.png"))
SetSpriteVisible(20,0)
PlaySprite(20,7,1,1,3)

//Create Sprite Floor
CreateSprite(21,0)
AddSpriteAnimationFrame(21,LoadImage("Floor1032x758.png"))
FloorX=0
FloorY=728.3
SetSpriteVisible(21,0)

//Create Sprite FloorF
CreateSprite(30,0)
AddSpriteAnimationFrame(30,LoadImage("FloorF1032x758.png"))
SetSpriteVisible(30,0)

//Create Sprite Arvore
CreateSprite(26,0)
AddSpriteAnimationFrame(26,LoadImage("Arvorezinha.png"))
TreeX=-60
TreeY=580
SetSpriteVisible(26,0)

//Create Sprite Arvore
CreateSprite(27,0)
AddSpriteAnimationFrame(27,LoadImage("Arvorezinha.png"))
SetSpriteVisible(27,0)

//Create Sprite ArvoreF
CreateSprite(28,0)
AddSpriteAnimationFrame(28,LoadImage("ArvorezinhaF.png"))
SetSpriteVisible(28,0)


//Create Sprite ArvoreF
CreateSprite(29,0)
AddSpriteAnimationFrame(29,LoadImage("ArvorezinhaF.png"))
SetSpriteVisible(29,0)

//Create Sprite Jump
CreateSprite(23,0)
AddSpriteAnimationFrame(23,LoadImage("Careca-pulo.png"))
SetSpriteVisible(23,0)
PlaySprite(23,1,1,1,1)

//Create Sprite Enemy Azul
CreateSprite(31,0)
AddSpriteAnimationFrame(31,LoadImage("InimigoVer1.png"))
AddSpriteAnimationFrame(31,LoadImage("InimigoVer2.png"))
AddSpriteAnimationFrame(31,LoadImage("InimigoVer3.png"))
AddSpriteAnimationFrame(31,LoadImage("InimigoVer4.png"))
AddSpriteAnimationFrame(31,LoadImage("InimigoVer5.png"))
AddSpriteAnimationFrame(31,LoadImage("InimigoVer6.png"))
SetSpriteVisible(31,0)
EnemyRigth=0
EnemyLeft=0
PlaySprite(31,7,1,1,6)
SpeedEnemyVer=1

//Create Sprite Enemy Vermelho
CreateSprite(24,0)
AddSpriteAnimationFrame(24,LoadImage("InimigoAz1.png"))
AddSpriteAnimationFrame(24,LoadImage("InimigoAz2.png"))
AddSpriteAnimationFrame(24,LoadImage("InimigoAz3.png"))
AddSpriteAnimationFrame(24,LoadImage("InimigoAz4.png"))
AddSpriteAnimationFrame(24,LoadImage("InimigoAz5.png"))
AddSpriteAnimationFrame(24,LoadImage("InimigoAz6.png"))
SetSpriteVisible(24,0)
EnemyRigth=0
EnemyLeft=0
PlaySprite(24,7,1,1,6)
SpeedEnemyAz=2


//Create sprite de cair
CreateSprite(25,0)
AddSpriteAnimationFrame(25,LoadImage("Caindo.png"))
SetSpriteVisible(25,0)
PlaySprite(25,1,1,1,1)

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
