class CategoriesController < ApplicationController
  #before_action :set_category, only: [:show, :update, :destroy, :create]

  # GET /categories
  def index
    @categories = Category.all

    render json: @categories
  end

  # GET /categories/1
  def show
    render json: @category
  end

  # POST /categories
  def create
    @category = Category.new(:name => params[:name], :description => params[:description], :user_id => params[:user_id])

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private
    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :description, :user_id)
    end
end
