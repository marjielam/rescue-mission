class QuestionsController < ApplicationController

  # GET /questions
  def index
    @questions = Question.order(created_at: :asc)

  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
  end

  # GET /questions/new
  def new
    @question = Question.new
    @notice = flash[:notice]
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Question was successfully created."
      redirect_to @question
    else
      flash[:notice] = "Invalid question."
      # redirect_to new_question_path
      render :new
    end
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
