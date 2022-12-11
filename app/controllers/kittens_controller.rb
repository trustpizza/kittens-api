class KittensController < ApplicationController
  before_action :show_kitten, only:[:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end


  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)

    if @kitten.save
      flash[:success] = 'Meow! You created a kitten!'
    else
      flash[:error] = 'There was an error processing your request'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = 'Kitten Destroyed'
    redirect_to root_path
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:success] = 'Kitten updated'
      redirect_to @kitten
    else
      flash[:error] = 'Could not update kitten'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

  def show_kitten
    @kitten = Kitten.find(params[:id])
  end
end
