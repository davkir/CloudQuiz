class Percentage
  def self.runcheck(score1)
       #Turn score into percentage
       progress1 = (score1.to_f/80*100)
       progress = progress1.to_i
    return progress
  end
end