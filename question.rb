class Question
  attr_accessor 
  def initialize
    num1 = rand(1..20)
    num2 = rand(1..20)
    question = "What does #{num1} plus #{num2} equal to?"
    question_answer = num1 + num2
  end
end