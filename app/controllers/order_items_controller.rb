class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
 
 
 

  





 def edit
  end

  

  

   def create
   
   	 @order_item = @order.order_items.new(quantity: 1, product_id: params[:product_id])

   	
   
    if @order_item.save
      redirect_to @order, notice: 'Successfully added product to cart.'
      
    else
       render action: 'new' 
     
  end
end
   	

   
       


 

  def update
    @order_item = OrderItem.find(params[:id])
    respond_to do |format|
      if order_item_params[:quantity].to_i == 0
        @order_item.destroy
        format.html { redirect_to @order_item.order, notice: 'Item was deleted from your cart.' }
        
      elsif @order_item.update(order_item_params)
        format.html { redirect_to @order_item.order, notice: 'Successfully updated the order item.' }
        
      else
        format.html { render action: 'edit' }
        
    end
  end
end

  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to @order_item.order }
      
    end
  end



  

private
def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id, :quantity)
    end



  






   

end






   

    






 

