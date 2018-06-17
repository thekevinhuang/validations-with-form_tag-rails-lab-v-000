class AuthorsController < ApplicationController
  before_action :load_author, only: [:show, :edit, :update]
  def show

  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def load_author
    @author = Author.find(params[:id])
  end
end
