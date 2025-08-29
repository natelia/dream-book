class DreamsController < ApplicationController
  before_action :set_dream, only: [:show, :edit, :update, :destroy]

  def index
    @dreams = Dream.ordered.first
  end

  def show
  end

  def new
    @dream = Dream.new
  end

  def create
  @dream = Dream.new(dream_params)

  if @dream.save
    respond_to do |format|
      format.html { redirect_to dreams_path, notice: "dream was successfully created." }
      format.turbo_stream
    end
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

    respond_to do |format|
    format.html { redirect_to dreams_path, notice: "Dream was successfully destroyed." }
    format.turbo_stream
    end
  end

   private

  def set_dream
    @dream = Dream.find(params[:id])
  end

  def dream_params
    params.require(:dream).permit(:name)
  end
end
