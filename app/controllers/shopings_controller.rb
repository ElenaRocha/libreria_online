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

  # # POST /shoping
  # def new
  #   @order = Order.new()

  #   respond_to do |format|
  #     if @order.save
  #       format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
  #       format.json { render :show, status: :created, location: @order }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /shoping
  def destroy
    puts "quiero primero ver #{order.inspect}"
    # puts "y luego #{book.inspect}"
    # order.books.delete(order.book_id=book.id)
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
