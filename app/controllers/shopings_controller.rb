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
    # puts "quiero primero ver #{order.inspect}"
    # puts "y luego #{book.inspect}"
    order.books.delete(order.book_id=book)
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
