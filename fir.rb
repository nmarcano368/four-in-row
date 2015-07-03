=begin problemas no solucionados:
1- Al llenarse una columna y volver a seleccionarla no le impide al jugador poner su ficha
generando un error. Sin embargo, el tablero se puede llenar y si esto ocurre da un mensaje de empate.
2- No realiza ningun chequeo de ganador, por lo que los jugadores juegan hasta llenar el tablero.
=end

require "colorize"

#crea tablero de juego.
def init_game_board(game_board)
	for i in 0..5
		b = []
		for j in 0..5
			b[j] = " "
		end
		game_board[i] = b
	end
end

#pinta tablero de juego.
def paint_game_board(game_board)
	puts ""
	for i in 0..game_board.length-1
		if ( i != 0 )
			puts "-----------".magenta
		end
		for j in 0..game_board.length-1
			if ( j != 0 )
				print "|".magenta
			end
			print game_board[i][j]
		end
		puts ""
	end
	puts ""
end

#algoritmo de juego.
def play_game( game_board, token )
	valid1 = false
	valid2 = false
	valid3 = false
	j = 5


	while (!valid1)
		puts "Indique posicion:".yellow
		print "columna: ".yellow
		position = gets.chomp.to_i-1
		if (position >= 0) && (position <=5) 
			valid1 = true
		else
			puts "valor de columnna incorrecta".red
		end
	end

	while(!valid2) 
		if (game_board[j][position] == " ")
			game_board[j][position] = token
			valid2 = true
		else
			j = j -1
		end
	end
	return game_board
end

#chequeo de ganador: Horizontal
def check_h_win( game_board, token )

end

#chequeo de ganador: Vertical
def check_v_win( game_board, token )
end

#chequeo de ganador: Diagonal up
def check_d_up_win( game_board, token )
end

#chequeo de ganador: Diagonal down
def check_d_down_win( game_board, token )
end

#lanzador del juego.
def init_game( game_board, p1, p2 )
	init_game_board( game_board )
	paint_game_board( game_board )
	cont = 0
	player = p1
	while(cont < game_board.length**2)
		game_board = play_game( game_board, player )
		cont = cont + 1
		paint_game_board( game_board )
		if false
			puts "Gano el jugador #{player}!".green
			cont = game_board.length**2+1
		end

		if ( player == p2)
			player = p1
		else
			player = p2 
		end
	end
	if (cont == game_board.length**2)
		puts "E".green + "m".red + "p".yellow + "a".blue + "t".black + "e".white
	end
end

board = []
player1 = "O".yellow
player2 = "X".blue

init_game( board, player1, player2 )