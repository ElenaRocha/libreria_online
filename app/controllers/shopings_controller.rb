class ShopingsController < ApplicationController

  # GET /shoping
  def index
    if Current.user.orders
      @order = Order.where(user_id: Current.user.id, state: "pending").to_a
      puts "Así es como se ven los pedidos #{@order}, qué tipo de objeto estoy manejando? #{@order.class}"
      # .take
    else
      @order = Order.new
    end
  end

  # POST /shoping
  def new

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