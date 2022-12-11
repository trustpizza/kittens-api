class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
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
    @kitten.destroy
    flash[:success] = 'Kitten Destroyed'
    redirect_to root_path
  end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = 'Kitten updated'
      redirect_to @kitten
    else
      flash[:error] = 'Could not update kitten'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def kitten_params
    require(params).permit(:name, :age, :cuteness, :softness)
  end
end
