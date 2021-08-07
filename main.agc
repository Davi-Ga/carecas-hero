
// Project: Careca's Hero 
// Created: 2021-06-03

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Careca's Hero" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 60, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts
SetDefaultWrapU(1)

//Incluir os arquivos
#include "Moviment.agc"
#include "Loader.agc"



//Inserir os shapes
gosub load_moviment	
gosub loade_images
gosub Load_sound
gosub Load_menu
gosub Load_titles

PlayMusic(6)


score=0
do
	
	xcroll#=xcroll#+.0006
	SetSpriteUVOffset(backspritem,xcroll#,0)
	GetPaused()

	if GetPointerPressed()=1

		if GetTextHitTest(1,GetPointerX(),GetPointerY()) //Clicar no botão Play Game
			
			GetResumed()
			
			DeleteMusic(6)
			//Deixa os botões invisíveis
			SetTextVisible(1,0) //Botão Start Game 
			SetTextVisible(2,0) //Botão Options 
			SetTextVisible(3,0) //Botão Exit 
			
			//Deixa o botão "Score" visível
			SetTextVisible(4,1)
			
			//Deixa as árvores visível
			SetSpriteVisible(26,1)
			SetSpriteVisible(27,1)
			
			//Deixa o inimigo visível
			SetSpriteVisible(24,1)
			
			//Deixa a logo e o background do menu invisíveis
			SetSpriteVisible(logosprite,0)
			SetSpriteVisible(backspritem,0)
			SetSpriteVisible(backsprite,1)
			SetSpritePosition(2,CarecaX,CarecaY)
			//Define o score = 0 ao iniciar o game
			SetTextString(4,"Score: "+str(score))
	
			//Ativa a música e define o seu volume
			PlayMusic(1,1)
			SetMusicSystemVolume(35)
			
			//Adiciona e anima o personagem jogável
			AddSpriteAnimationFrame(2,LoadImage("Careca-parado.png"))
			AddSpriteAnimationFrame(2,LoadImage("Careca-andando1.png"))
			AddSpriteAnimationFrame(2,LoadImage("Careca-andando2.png"))
			PlaySprite(2,7,1,1,3)
			
			//Deixa o Careca e o background visíveis
			SetSpriteVisible(2,1)
			SetSpriteVisible(21,1)
		
			EnemyX=1000
			EnemyY=680

				
	
		endif
		
	endif	
if GetSpriteCollision(2,24)=1
					
					//Deixa os botões invisíveis
					SetTextVisible(1,1) //Botão Start Game 
					SetTextVisible(2,1) //Botão Options 
					SetTextVisible(3,1) //Botão Exit 
					
					//Deixa o botão "Score" visível
					SetTextVisible(4,0)
					
					//Deixa as árvores invisível
					SetSpriteVisible(26,0)
					SetSpriteVisible(27,0)
					
					//Deixa o inimigo invisível
					SetSpriteVisible(24,0)
					
					//Deixa a logo e o background do menu visível
					SetSpriteVisible(logosprite,1)
					SetSpriteVisible(backspritem,1)
					SetSpriteVisible(backsprite,0)
					
					EnemyX=0
					EnemyY=0
				
endif	

	if GetPointerPressed()=1

		if GetTextHitTest(2,GetPointerX(),GetPointerY()) //Clicar no botão Options
		
			SetTextVisible(1,0) //Botão Start Game invisível
			SetTextVisible(2,0) //Botão Options invisível
			SetTextVisible(3,0) //Botão Exit invisível
			SetTextVisible(5,1) //Botão Back visível 
			SetTextVisible(6,1)
			SetSpriteVisible(logosprite,0)
				
		endif
	
	endif
	
		if GetPointerPressed()=1

			if GetTextHitTest(5,GetPointerX(),GetPointerY()) //Clicar no botão Back
		
			SetTextVisible(1,1) //Botão Start Game visível
			SetTextVisible(2,1) //Botão Options visível
			SetTextVisible(3,1) //Botão Exit visível
			SetTextVisible(5,0) //Botão Back invisível 
			SetTextVisible(6,0)
			SetSpriteVisible(logosprite,1)
				
		endif
	
	endif	
	
		if GetPointerPressed()=1

			if GetTextHitTest(3,GetPointerX(),GetPointerY()) //Clicar no botão Exit
		
			end //Finaliza o jogo
				
		endif
	
	endif	
	
	
		if GetRawKeyState(39) //Pressionar a setinha da direita
			
				//Move o personagem para a direita
				SetSpriteFlip(2,0,0) //Define um flip mantendo o personagem para direita
				CarecaX=CarecaX+Speed//Move somando a sua posição com o speed
				SetSpritePosition(2,CarecaX,CarecaY)
				CarecaRight=1	//Deixa a variável CarecaRight como true
				CarecaLeft=0
				
				
					elseif	GetRawKeyState(37) //Pressionar a setinha para esquerda
					
							//Move o personagem para a direita
							SetSpriteFlip(2,180,0) //Define um flip de 180 mantendo o personagem para esquerda
							CarecaX=CarecaX-Speed //Move subtraindo a sua posição com o speed
							SetSpritePosition(2,CarecaX,CarecaY)
							CarecaRight=0
							CarecaLeft=1 //Deixa a variável CarecaLeft como true
							
			
			else
				if (GetSpritePlaying(2)=1) 	//Ao se mover, a animação de andar será iniciada
					PlaySprite(2,10,1,1,3)
					
				endif
			endif
				
		

if GetRawkeyState(90) and CarecaRight=1 //Pressionar a tecla 'Z' e CarecaRight for true
	
		//Animação de socar
		SetSpritePosition(20,CarecaX,CarecaY)  //Define a posição do sprite de soco
		SetSpriteVisible(20,1)	//Deixa a animação de soco visível
		SetSpriteFlip(20,0,0) //Define um flip mantendo o personagem dando um soco para direita
		SetSpriteVisible(2,0) //Deixa a animação de andar invisível
		
	//Se a variável shooting for 0 entre nesse se	
	if shooting=0
	shooting=1 //Define a variável shooting como 1
	
		//Faça até 4 vezes o bullet
		for b=0 to 3
				
			//Se as bullets forem 0 entre nesse se	
			if all_bullets[b].Active=0
				
				all_bullets[b].Active=1	//Ativa as bullets	
				all_bullets[b].BulletX=CarecaX+30 //Define sua posição em X
				all_bullets[b].Bullety=Carecay+10 //Define sua posição em Y
				PlaySound(2)
			
					SetSpriteVisible(3+b,1) //Torna as sprites da bullet visíveis
			
			exit
			endif
		next b
	endif

else
	
	//Torna a animação de soco invisível e a animação de andar visível
	SetSpriteVisible(20,0)
	SetSpriteVisible(2,1)
	
	//Define a variável shooting como 0 novamente
	shooting=0
endif //Termina todo o se

//Faça 4 vezes o bullet
for b = 0 to 3
	
	//Se as bullets forem 1 entre nesse se	
	if all_bullets[b].Active=1
			
		all_bullets[b].BulletX=all_bullets[b].BulletX+5	 //Define a velocidade da bullet em linha reta
		
			if 	all_bullets[b].BulletX>1500 then all_bullets[b].Active=0  //A bullet irá até a posição demarcada
			
	endif	
next b

//Faça 4 vezes o bullet
for b = 0 to 3
	
	//Se as bullets forem 1 entre nesse se	
	if all_bullets[b].Active=1
		
		if GetSpriteCollision(24,3+b)=1  //Define uma colisão entre a bullet e o inimigo
			
			if score<30
					score=score+1 //Ao acertar um inimigo na direita, soma-se no score
					SetTextString(4,"Score: "+str(score)) //Mostra o score e a quantidade exata de inimigos mortos
					PlaySound(4) //Som do inimigo sendo atingido
			endif	
			all_bullets[b].Active=0 //Desativa a bala ao colidir com o inimigo
			
			SetSpriteVisible(3+b,0) //Torna a sprite da bullet invisível ao colidir com o inimigo
			EnemyX=1100 //Reseta a posição do inimigo, fazendo ele "renascer"
			
		endif	
		
	endif
next b		

//Faça 4 vezes o bullet
for b=0	to 3
	
	SetSpritePosition(3+b, all_bullets[b].BulletX,all_bullets[b].BulletY) //Fica defindo a posição do sprite da bullet, fazendo-a se mover
		
next b	


if GetRawKeyState(90) and CarecaLeft = 1    //Pressionar a tecla 'Z' e CarecaLeft for true
	
	//Animação de socar
	SetSpritePosition(20,CarecaX,CarecaY) //Define a posição do sprite de soco
	SetSpriteVisible(20,1) //Deixa a animação de soco visível
	SetSpriteFlip(20,180,0) //Define um flip de 180 mantendo o personagem dando um soco para esquerda
	SetSpriteVisible(2,0) //Deixa a animação de andar invisível
	
	//Se a variável shooting2 for 0 entre nesse se
	if shooting2=0
	
		shooting2=1 //Define a variável shooting2 como 1
	
//Faça 4 vezes o bullet	
	for b2 = 0 to 3
		
		//Se as bullets forem 0 entre nesse se
		if all_bullets2[b2].ActiveLeft=0
			
			all_bullets2[b2].ActiveLeft=1 //Ativa as bullets 
			all_bullets2[b2].BulletLeft_X=CarecaX -30 //Define a posição em X
			all_bullets2[b2].BulletLeft_Y=CarecaY +15 //Define a posição em Y
			PlaySound(2) //Som da bullet
			
			SetSpriteVisible(7+b2,1) //Torna as sprites da bullet visíveis
			
			exit
			endif
		next b2
		endif
else
	
	shooting2=0  ////Define a variável shooting2 como 0 novamente
endif

//Faça 4 vezes o bullet
for b2=0 to 3
	
	//Se as bullets forem 1 entra nesse se
	if all_bullets2[b2].ActiveLeft=1
		
		all_bullets2[b2].BulletLeft_X=all_bullets2[b2].BulletLeft_X-6 //Define a velocidade da bullet na esquerda
		
		if all_bullets2[b2].BulletLeft_X<-100 then all_bullets2[b2].ActiveLeft=0 //A bullet irá até a posição demarcada para a esquerda
			
	endif
next b2

//Faça 4 vezes o bullet
for b2 = 0 to 3
	
	//Se as bullets forem 1 entra nesse se
	if all_bullets2[b2].ActiveLeft=1
		
		if GetSpriteCollision(24,7+b2)=1 //Define uma colisão entre a bullet e o inimigo na esquerda
			
				if score<30
					score=score+1 //Ao acertar um inimigo na esquerda, soma-se no score
					SetTextString(4,"Score: "+str(score)) //Mostra o score e a quantidade exata de inimigos mortos
					PlaySound(4) //Som do inimigo sendo atingido
				endif	
			
			all_bullets2[b2].ActiveLeft=0 //Desativa a bala ao colidir com o inimigo
			
			SetSpriteVisible(3+b,0) //Torna a sprite da bullet invisível ao colidir com o inimigo
			EnemyX=1100 //Reseta a posição do inimigo na esquerda, fazendo ele "renascer"
			
		endif	
		
	endif
next b2

//Faça 4 vezes o bullet
for b2=0 to 3
	SetSpritePosition(7+b2,all_bullets2[b2].BulletLeft_X,all_bullets2[b2].BulletLeft_Y) //Fica defindo a posição do sprite da bullet, fazendo-a se mover para a esquerda
next b2


SetSpritePosition(24,EnemyX,EnemyY) //Define a posição do inimigo

	if EnemyX<CarecaX //Se a posição do inimigo for menor que o Careca, entra nesse se
		
		SetSpriteFlip(24,180,0) //Define um flip de 180 mantendo o inimigo para a esquerda
		EnemyX=EnemyX+2.5 //Define a posição do inimigo, fazendo-o "seguir" o Careca
		
endif
	
	if EnemyX>CarecaX //Se a posição do inimigo for maior que o Careca, entra nesse se
		
		SetSpriteFlip(24,0,0)  //Define um flip mantendo o inimigo para a direita
		EnemyX = EnemyX-2.5 //Define a posição do inimigo, fazendo-o "seguir" o Careca
endif		

SetSpritePosition(21,FloorX,FloorY) //Define a posição do chão
SetSpritePosition(26,TreeX,TreeY) //Define a posição da árvore direita
SetSpritePosition(27,950,TreeY) //Define a posição da árvore esquerda

	if GetSpriteCollision(2,21) = 1 or Jump = 1 //Define uma colisão entre o careca, ou caso a variável Jump for true
		
		Fall=0  //Define a variável Fall como false, fazendo o personagem ir para o ar
		
			else
				Fall=1 //Define a variável Fall como true, fazendo o personagem ficar no chão
			
endif	    
			
	if Fall=0 //Se a variável Fall for false, entra nesse se
		
		CarecaY=CarecaY+0  //Define a posição em Y
		
			elseif Fall=1  //Se a variável Fall for true, entra nesse se
			
				CarecaX=CarecaX+0 //Define a posição em X
endif
	
	if GetRawKeyPressed(32)  //Pressionar o botão "espaço"
			
		Jump=1  //Define a variável Jump=1
		PlaySound(3)
		
endif	

	if Jump=1 //Se a variável Jump for true
		
		//A sprite de pulo é executada
		SetSpritePosition(23,CarecaX,CarecaY)
		SetSpriteVisible(23,1)
		SetSpriteVisible(2,0)
		SetSpriteFlip(23,0,0)
		
		
		SetSpritePosition(2,CarecaX,CarecaY)
		Fall=0
		JumpTimer=JumpTimer+2.7 //Define até onde o pulo irá
		Movement=6 //Define a velocidade do pulo
		
			if JumpTimer<80 
				
				CarecaY=CarecaY-Movement
				
					elseif JumpTimer>83
						
						CarecaY=CarecaY+Movement
						SetSpritePosition(25,CarecaX,CarecaY)
						SetSpriteFlip(25,0,0)
						SetSpriteVisible(25,1)
						SetSpriteVisible(23,0)
				
					endif					
	
		if GetSpriteCollision(2,21)=1 and JumpTimer >80
		
			Movement=0
			Fall=0
			JumpTimer=0
			Jump=0
			SetSpriteVisible(23,0)
			SetSpriteVisible(25,0)
			
		endif	
endif	

	if Jump=1 and CarecaLeft=1
		SetSpritePosition(23,CarecaX,CarecaY)
		SetSpriteVisible(23,1)
		SetSpriteVisible(2,0)
		SetSpriteFlip(23,180,0)
		
			if JumpTimer<80 
				
				
				
					elseif JumpTimer>83 and CarecaLeft=1
						
					
						SetSpritePosition(25,CarecaX,CarecaY)
						SetSpriteFlip(25,180,0)
						SetSpriteVisible(25,1)
						SetSpriteVisible(23,0)
				
			endif	
endif	
	
			
			
		if score=30
			
			
			print("Taujiro é corno")
			
endif	

 		
	sync()			
	loop	
