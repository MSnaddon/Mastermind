require ('pry-byebug')
class Master
  attr_reader :player, :solution
  attr_accessor :turn_counter

  def initialize()
    @turn_counter = 1
    @solution = []
  end

  def summon_the_master()
    peg_array = ["B","Y","G","R"]
    for i in 0..3
      @solution.push(peg_array[rand(0..3)])
    end
  end

  def translate_guess(player_input)
    return player_input.upcase.split(" ")
  end

  def compare(guess)
    reds = 0
    whites = 0
    slave = @solution.clone
    i = guess.size-1
    while i>=0
      if guess[i]==slave[i]
        reds+=1
        guess.delete_at(i)
        slave.delete_at(i)
      end
      i -= 1
    end
    i = guess.size-1
    while i>=0
      for peg in slave
        if guess[i] == peg
          whites += 1
          slave.delete_at(slave.index(peg))#bug to be splat          break
        end
      end
      i -= 1
    end
    return reds, whites
  end

end