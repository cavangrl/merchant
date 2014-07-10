class ProductsController < ApplicationController
 before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index
    @products = Product.all
  end

 
  def show
  end

  
  def new
    @product = Product.new
  end

  
  def edit
  end

 
  
def create
  @product = Product.new(product_params)
    
  if @product.save
    redirect_to @product, notice: 'Product was successfully created.'
    # format.html { render action: "new" }
  end
end






 
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
       
      else
        format.html { render action: 'edit' }
        
      end
    end
  end

  
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      
    end
  end

  private
   
    def set_product
      @product = Product.find(params[:id])
    end

   
    def product_params
      params.require(:product).permit(:title, :price, :description, :image_url)
    end

   
end


  