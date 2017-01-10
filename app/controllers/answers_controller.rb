class AnswersController < ApplicationController
  # def index
  #   @question = Question.find(params[:question_id])
  #   @answers = @question.answers
  # end
  #
  # def new
  #   @question = Question.find(params[:question_id])
  #   @answer = Answer.new
  # end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answers = @question.answers

    if @answer.save
      flash[:notice] = ["Answer saved successfully."]
      redirect_to question_path(@question)
    else
      flash.now[:notice] = @answer.errors.full_messages
      render :'/questions/show'
    end
  end

  def delete
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end
end
