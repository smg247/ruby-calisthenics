class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    if validate?(player1) && validate?(player2) then
      if player1[1] == 'R' then
        if player2[1] == 'P' then
          return player2
        end
      elsif player1[1] == 'P' then
        if player2[1] == 'S' then
          return player2
        end
      else # S
        if player2[1] == 'R' then
          return player2
        end
      end
      # If player2 was not determined to have won then player1 must have won or tied
      # Ties go to player1
      return player1
    end
  end

  def self.tournament_winner(tournament)
    if tournament[0][0].is_a? String then
      return self.winner(tournament[0], tournament[1])
    else
      return self.winner(self.tournament_winner(tournament[0]), self.tournament_winner(tournament[1]))
    end
    
  end
  
  def self.validate?(player)
    if player.length != 2 || player[1] !~/(R|P|S)/ then
      raise NoSuchStrategyError, "Strategy must be one of R,P,S"
    end
    
    return true
  end

end
