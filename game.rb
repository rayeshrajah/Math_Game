require_relative 'player'
require_relative 'question'

class Game
  attr_reader :turn
  def initialize
    #prompting the users to enter thier names
    puts "Player1 enter your name: "
    @name1 = gets.chomp
    puts "Player2 enter your name: "
    @name2 = gets.chomp
    @turn = 0
    #Creating new players and putting them in an array
    @player1 = Player.new(@name1)
    @player2 = Player.new(@name2)
    @players = [@player1, @player2].shuffle
  end
  
  #boolean to check the game condition
  def play_game
    @game = true 
    while @game
      if players_turn
        @game = false
      end
    end
    puts "---- Game Over ----"
    puts "Good bye!"
  end

  #Switch turns for players
  def next_turn
    if @turn === 0
      @turn = 1
    else
      @turn = 0
    end 
  end

  def players_turn
    puts "----- Question -----"
    @questions = Question.new
    puts "#{@players[@turn]}: #{question.question}"
    @answer = gets.chomp
    @ans = question.check_ans(@answer)
    #checks answer is right
    if(@ans)
      puts "#{@players[@turn]}: YES! You are correct!"
      next_turn
    else
      puts "#{@players[@turn]}: Seriously? No!"
      @players[@turn].take_life
        puts @player1.to_s "vs" @player2.to_s
      next_turn
    end
    #If player lives has reached 0  then display score message
    if @players[@turn].lives === 0
      next_turn
      puts "#{@players[@turn].name} wins with a score of #{@players[@turn].lives}/3"
      return true
    end
    #next players turn
    next_turn
    return false
  end
end