class Player
    attr_reader :player_name, :player_value
    
    def initialize
      puts "Bonjour merci de saisir votre nom de joueur :"  
      @player_name = gets.chomp
      puts "Très bien, maintenant choisis un symbole :"
      @player_value = gets.chomp
    end
  end
  

  #class Player
    #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
  
    
    #def initialize
      #TO DO : doit régler son nom et sa valeur
    #end