#Tic-Tac-Toe in ruby by Jahvon
system "clear" #CLears the terminal for the game
#Intro message and ask for names
puts "Welcome to the wonderful game of tic-tac-toe!"
print "Player one, what is your name? " 
oneName = gets.chomp
print "Player two, what is your name? "
twoName = gets.chomp

#Initial values on the game board
@game = {1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"}

#Method that shows the board on a cleared screen
def showBoard
	system "clear"
	@board = "#{@game[1]}|#{@game[2]}|#{@game[3]}\n-------\n#{@game[4]}|#{@game[5]}|#{@game[6]}\n-------\n#{@game[7]}|#{@game[8]}|#{@game[9]}"
	puts "\n"
	puts @board
	puts "\n"
end

#Method that validates a number on the board was entered and is not in use
def validateMove
	pos = gets.chomp.to_i
	while (pos > 9 || pos < 1) do
		print "You have entered an invalid position. Try again: "
		pos = gets.chomp.to_i
	end
	while @game[pos]==("X")||@game[pos]==("O")
		print "You cannot make you move in that spot. Try again: "
		pos = gets.chomp.to_i
	end
	return pos
end

#Method ran for player 1, X. Ask where to place it and sets the value
def oneMove(name, game)
	print "#{name}, where would you like to place an X? "
	pos = validateMove
	@game.each do |key, value|
		if key==pos
			@game[pos]="X"
		end
	end
end

#Method ran for player 2, O. Ask where to place it and sets the value
def twoMove(name, game)
	print "#{name}, where would you like to place an O? "
	pos = validateMove
	@game.each do |key, value|
		if key==pos
			@game[pos]="O"
		end
	end
end

#Method that checks if the board if filled with X's and O's
def boardFull?
	if @game.has_value?("1")||@game.has_value?("2")||@game.has_value?("3")||@game.has_value?("4")||@game.has_value?("5")||@game.has_value?("6")||@game.has_value?("7")||@game.has_value?("8")||@game.has_value?("9")
		return false
	else
		return true
	end
end

#Alternates between turns until the board is filled
def altTurns(oneName, twoName)
@num = 1
	while boardFull? == false do
		if @num%2==1
			oneMove(oneName, @game)
			showBoard
		end
		if @num%2==0
			twoMove(twoName, @game)
			showBoard
		end
		@num += 1
	end
end

#What essentially runs when the program starts
showBoard #Shows initial board
altTurns(oneName, twoName) #Alternate turnes
puts "Game over, thanks for playing!" #End of game
