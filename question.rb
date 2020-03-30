class Question
  attr_accessor :num1, :num2, :question, :question_answer
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @question = "What does #{num1} plus #{num2} equal to?"
    @question_answer = num1 + num2
  end

  def check_ans(ans)
    #puts the user input as an interger
    ans.to_i == @question_answer
  end

end