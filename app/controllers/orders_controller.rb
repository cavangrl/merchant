class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :confirm]

  
  def index
    @orders = Order.all
  end

  
  def show
  end

 
  def new
    @order = Order.new
  end

  
  def edit
  end


  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        redirect_to @order, notice: 'Order was successfully created.' 
       
      else
        render action: 'new' 
       
      end
    end
  end


  def update
    respond_to do |format|
      if @order.update(order_params.merge(status: 'submitted'))
        redirect_to confirm_order_path(@order), notice: 'Order was successfully updated.' 
        
      else
        render action: 'edit' 
        
      end
    end
  end

  
  def destroy
    @order.destroy
    respond_to do |format|
      redirect_to products_path 
     
    end
  end

  def confirm
  end

  private
  
    def set_order
      @order = Order.find(params[:id])
    end

    
      params.require(:order).permit(:user_id, :status,)
    end
