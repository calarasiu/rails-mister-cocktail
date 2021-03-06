class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    if params[:query].present?
      @cocktails = Cocktail.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cocktails = Cocktail.all 
    end
    @order = Order.new
  end 

  def show
    @dose = Dose.new
    @order = Order.new
  end

   def new 
     @cocktail = Cocktail.new
   end

  def create 
    @cocktail = Cocktail.new(set_params)
    if @cocktail.save 
      redirect_to cocktail_path(@cocktail)
    else 
      render "new" 
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def set_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
