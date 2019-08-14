class QuestionsController < ApplicationController

  # GET /questions
  def index
    @questions = Question.order(created_at: :desc)
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :asc)
    @answer = Answer.new
  end

  # GET /questions/new
  def new
    @question = Question.new
    @notice = flash[:notice]
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:notice] = ["Question was successfully created."]
      redirect_to @question
    else
        flash.now[:notice] = @question.errors.full_messages
      # redirect_to new_question_path
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if params[:question][:favorite]
      @answer = Answer.find(params[:question][:favorite])
      @question.favorite_id = @answer.id
    end

    if @question.update(question_params)
      flash[:notice] = ["Question updated successfully."]
      redirect_to @question
    else
      flash.now[:notice] = @question.errors.full_messages
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.answers.each do |answer|
        answer.destroy
      end
      @question.destroy
      flash[:notice] = ["Question was successfully deleted."]
      redirect_to questions_path
    else
      flash[:notice] = ["You can only delete your own questions"]
      redirect_to @question
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
