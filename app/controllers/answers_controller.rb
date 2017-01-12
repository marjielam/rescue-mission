class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user

    @answers = @question.answers

    if @answer.save
      flash[:notice] = ["Answer saved successfully."]
      redirect_to question_path(@question)
    else
      flash.now[:notice] = @answer.errors.full_messages
      render :'/questions/show'
    end
  end

  def update
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end
end
