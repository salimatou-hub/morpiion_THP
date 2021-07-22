require 'bundler'
Bundler.require

require_relative 'player'
require_relative 'board_case'
require_relative 'board'

class Game
  attr_accessor :player1, :player2, :board

  def initialize
    # On démarre le jeu : création des joueurs et du morpion
    puts "Nom du joueur 1 ? (X)"
    print "> "
    name_player1 = gets.chomp
    @player1 = Player.new("#{name = name_player1}", "#{symbol = "X"}")
    # @@player << @player1
    #sleep(2)
    puts "Nom du joueur 2 ? (O)"
    print "> "
    name_player2 = gets.chomp
    @player2 = Player.new("#{name = name_player2}", "#{symbol = "O"}")
    # @@player << @player2
    puts "Bienvenue dans Super Morpion #{name_player1} et #{name_player2}"
    @board = Board.new
 
  end #initialize
  
  def go
    # On lance la partie, 
    puts " #{player1.player_name} va jouer le premier"
    play_turn #On fait appel à la méthode play_turn ci-dessous
  end

  def play_turn
    puts "#{@board.start}"
    puts "#{@board.top}"
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
    turn = 1
    while turn < 10 && !victory do # Morpion = 9 tours
        if turn.odd?  # tour impair pour joueur 1 
          sleep (2)
          puts "#{@board.start}"
          puts "#{@board.show_game}"
          puts " #{player1.player_name}, c'est à votre tour"
          print ">"
          next_move = gets.chomp
          if @board.get_cases_array.any? {|x| x.position == next_move} # La position est exacte ...
            @board.get_cases_array.each do |x| 
              if x.position == next_move
                if x.content == " "     # ... et le contenu de la case est vide.
                  x.content = "#{player1.player_symbol}"
                  if self.victory # condition victoire p1
                    puts "#{@board.start}"
                    puts "#{@board.show_game}"
                    puts "#{player1.player_name} a remporté la partie !"
                  end               
                else
                  puts "Dommage, la case est déjà rempli"
                  turn -=1
                end # On veut rejouer le tour car une case est déja renseignée
              end
            end
          else
            puts "Erreur, cette case n'existe pas'"
            turn -=1 # On veut rejouer le tour car la case choisie n'existe pas
          end
        elsif !victory  # tour pair pour joueur 2
          sleep (2)
          puts "#{@board.start}"
          puts "#{@board.show_game}"
          puts "C'est votre tour #{player2.player_name}, tâchez de gagner cette fois-ci !"
          print ">"
          next_move = gets.chomp
          if  @board.get_cases_array.any? {|x| x.position == next_move}  # La position est exacte ...
            @board.get_cases_array.each do |x|
              if x.position == next_move
                if x.content == " "        # ... et le contenu de la case est vide.
                  x.content = "#{player2.player_symbol}" 
                  if self.victory #  condition victoire p2
                    puts "#{@board.start}"
                    puts "#{@board.show_game}"
                    puts "#{player2.player_name} a remporté la partie !"
                  end
                else
                  puts "Dommage, la case est déjà rempli"
                  turn -=1
                end
              end
            end
          else
            puts "Erreur, cette case n'existe pas"
            turn -=1 # On veut rejouer le tour car la case choisie n'existe pas
          end
        end
        turn += 1
    end # boucle while
    if turn == 10 && !victory
      puts "Match nul!"
    end
    puts "Partie terminée"
  end # play_turn


  def victory
    # une méthode qui vérifie le plateau et indique s'il y a un vainqueur 
    if @board.get_cases_array[0].content == @board.get_cases_array[1].content && @board.get_cases_array[1].content == @board.get_cases_array[2].content && @board.get_cases_array[2].content !=" "
      return true
    elsif @board.get_cases_array[3].content == @board.get_cases_array[4].content && @board.get_cases_array[4].content == @board.get_cases_array[5].content && @board.get_cases_array[5].content !=" "
      return true
    elsif @board.get_cases_array[6].content == @board.get_cases_array[7].content && @board.get_cases_array[7].content == @board.get_cases_array[8].content && @board.get_cases_array[8].content !=" "
      return true
    elsif @board.get_cases_array[0].content == @board.get_cases_array[3].content && @board.get_cases_array[3].content == @board.get_cases_array[6].content && @board.get_cases_array[6].content !=" "
      return true
    elsif @board.get_cases_array[1].content == @board.get_cases_array[4].content && @board.get_cases_array[4].content == @board.get_cases_array[7].content && @board.get_cases_array[7].content !=" "
      return true
    elsif @board.get_cases_array[2].content == @board.get_cases_array[5].content && @board.get_cases_array[5].content == @board.get_cases_array[8].content && @board.get_cases_array[8].content !=" "
      return true
    elsif @board.get_cases_array[0].content == @board.get_cases_array[4].content && @board.get_cases_array[4].content == @board.get_cases_array[8].content && @board.get_cases_array[8].content !=" "
      return true
    elsif @board.get_cases_array[2].content == @board.get_cases_array[4].content && @board.get_cases_array[4].content == @board.get_cases_array[6].content && @board.get_cases_array[6].content !=" "
      return true
    else
      return false
    end
  end #victory
 
end # end Game