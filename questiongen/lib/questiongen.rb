class Questiongen

  def self.runcheck(score1)
     #Gets Level 1 & 2 challenge - Addition
     if score1 < 20
       if score1 < 10
         @random1 = rand(1...50)
         @random2 = rand(1...50)
       else
         @random1 = rand(50...100)
         @random2 = rand(50...100)
       end
     quiz = { :question => "What is #@random1 plus #@random2 ?",
                :answer => @random1+@random2 }
     #Gets Level 3 & 4 challenge - Subtraction
     elsif score1 < 40
       if score1 < 30
         @random1 = rand(1...50)
         @random2 = rand(1...50)
         if @random1 < @random2
           @random3 = @random2
           @random4 = @random1
         else
           @random3 = @random1
           @random4 = @random2
         end
       else
         @random1 = rand(50...100)
         @random2 = rand(50...100)
         if @random1 < @random2
           @random3 = @random2
           @random4 = @random1
         else
           @random3 = @random1
           @random4 = @random2
         end
       end
        quiz = { :question => "What is #@random3 minus #@random4 ?",
                :answer => @random3-@random4 }
       #Gets Level 5 & 6 challenge - Multiplication
     elsif score1 < 60
       if score1 < 50
         @random1 = rand(1...12)
         @random2 = rand(1...12)
       else
         @random1 = rand(12...24)
         @random2 = rand(12...24)
       end
        quiz = { :question => "What is #@random1 multipled by #@random2 ?",
                :answer => @random1*@random2 }
     #Gets Level 7 & 8 challenge - Division
     elsif score1 < 80
       if score1 < 70
         @random1 = rand(1...100)
         @random2 = rand(1...10)
         if @random1 < @random2
           @random3 = @random2
           @random4 = @random1
         else
           @random3 = @random1
           @random4 = @random2
         end
       else
         @random1 = rand(100...150)
         @random2 = rand(10...15)
         if @random1 < @random2
           @random3 = @random2
           @random4 = @random1
         else
           @random3 = @random1
           @random4 = @random2
         end
       end
         quiz = { :question => "What is #@random3 divided by #@random4 ?",
                :answer => @random3/@random4 }
     else
       #If user has completed the quiz
       quiz = "Complete"
     end
    #Return quiz so that the controller can handle it
  return quiz
end
  
end