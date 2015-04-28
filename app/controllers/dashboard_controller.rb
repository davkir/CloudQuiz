class DashboardController < ApplicationController
  

    before_filter :authenticate_user!
    

  #Displays Answer with question for testing
  #<p><%= @correctans1 %></p>
  
  
   def index
     #Get score
     @score1 = current_user.score
     
     #Get Level
     @level = current_user.level
     
     #Get @progress from Percentage Gem
     @progress = Percentage.runcheck(@score1.to_i)
     
     #Get Question and Answer from Questiongen Gem
     @quiz = Questiongen.runcheck(@score1.to_i)
     @quiz1 = @quiz
     
     #If @quiz1 is set to "Complete" through the gem then the user will be redirected to the completed page
     if @quiz1 == "Complete"
       redirect_to :action => "complete"
     else
       
     #Get the answer from the gem
     @correctans1 = @quiz1[:answer]
     @@correctans = @quiz1[:answer]
     end
  end

  def check
    
    #Parse answer into integer
    params[:answer] = params[:answer].to_i
    
    #Checks if answer is correct
    if params[:answer] == @@correctans
      
      #Updating Score
       @score1 = current_user.score
       @score1 = @score1 += 1
       current_user.update(score: @score1)
      
      #Updating Level
      if @score1 < 10
        @level1 = 1
      elsif @score1 < 20
        @level1 = 2
      elsif @score1 < 30
        @level1 = 3
      elsif @score1 < 40
        @level1 = 4
      elsif @score1 < 50
        @level1 = 5
      elsif @score1 < 60
        @level1 = 6
      elsif @score1 < 70
        @level1 = 7
      elsif @score1 < 80
        @level1 = 8
      else
        @level1 = 9
      end
      current_user.update(level: @level1)
    else
       @score1 = current_user.score
    end
    
    #Redirects to index method
    redirect_to :action => "index"
  end

  def complete
    
    #If score is below 80 then user is redirected to the quiz page
     @score1 = current_user.score
    if @score1 != 80
     redirect_to :action => "index"
   else
   end
  end
  
  def reset
    
    #Reset user's score and level when reset
    @score1 = 0
    current_user.update(score: @score1)
    @level1 = 1
    current_user.update(level: @level1)
    redirect_to :action => "index"
  end
end