class Show
  
  def show_board(board)
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
    board.grid.each.with_index do |cell, index|
      if (index%3 == 0)
        puts
      end
      print "|#{cell[1]}|"
    end 
    puts
    return false
  end



end

#class Show

  #def show_board(board)
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
  #end

#end

#class Application
  #def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    # 

  #end

#end