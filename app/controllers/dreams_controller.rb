class DreamsController < ApplicationController
  before_action :set_dream, only: [:show, :edit, :update, :destroy]

  def index
    @dreams = Dream.all
  end

  def show
  end

  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)

    if @dream.save
      redirect_to dreams_path, notice: "Dream was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @dream.update(dream_params)
      redirect_to dreams_path, notice: "Dream was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dream.destroy
    redirect_to dreams_path, notice: "Dream was successfully destroyed."
  end

   private

  def set_dream
    @dream = Dream.find(params[:id])
  end

  def dream_params
    params.require(:dream).permit(:name)
  end
end
