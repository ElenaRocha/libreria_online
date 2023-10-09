class ShopingsController < ApplicationController
  
  # GET /shoping
  def index
    if Current.user.orders
      # && Current.user.orders.state = pending
      @order = Order.where(state: "pending")
    else
      @order = Order.new
    end
  end

  # POST /shoping
  def new
    # if Current.user.orders? 
    #   # && Current.user.orders.state = pending
    #   @order = Order.where(state: "pending").take
    #   # @orders = Order.all
    # else
    #   @order = Order.new
    # end
  end

  # GET /shoping/:id
  def show
    @order = Order.where(user_id: Current.user.id)
  end

  # DELETE /shoping
  def destroy
    order.books.delete(order.book_id=book.id)
  end

end