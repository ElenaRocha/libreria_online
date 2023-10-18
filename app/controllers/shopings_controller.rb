class ShopingsController < ApplicationController

  # GET /shoping
  def show
    @order = Order.where(user_id: Current.user.id).to_a
  end

  # GET /shoping/:id
  def index
    if Current.user.orders.any? { |order| order.state == "activo"}
      @order = Order.where(user_id: Current.user.id, state: "activo").to_a.last
      @book = Book.find(params[:id])
      @order.books << @book
    else
      @book = Book.find(params[:id])
      @order = Current.user.orders.create(state: "activo")
      @order.books << @book
    end
  end

  # DELETE /shoping
  def destroy
    @order = Order.find(params[:order_id])
    @order.books.find_by_sql(" DELETE FROM `books_orders` WHERE `books_orders`.`order_id` = 20 AND `books_orders`.`book_id` = 1 LIMIT 1")
    redirect_to shoping_path
  end

  # POST /shoping/finish/:id
  def finish
    @order = Order.find(params[:id])
    @order.state = "finalizado"
    @order.save
    redirect_to shoping_path
  end

end
