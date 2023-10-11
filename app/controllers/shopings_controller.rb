class ShopingsController < ApplicationController

  # GET /shoping/:id
  def index
    if Current.user.orders.any? { |order| order.state == "pending"}
      @order = Order.where(user_id: Current.user.id, state: "pending").to_a.last
      @book = Book.find(params[:id])
      @order.books << @book
    else
      @book = Book.find(params[:id])
      @order = Order.new()
      @order.books << @book
      redirect_to books_path
    end
  end

  # # POST /shoping
  # def new
  #   @order = Order.new()
  #   # @order = @user.orders.create(:order_date => Time.now)

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

  # GET /shoping
  def show
    @order = Order.where(user_id: Current.user.id).to_a
  end

  # POST /shoping/finish/:id
  def finish
    @order = Order.find(params[:id])
    @order.state = "finished"
    @order.save
    redirect_to shoping_path
  end

  # DELETE /shoping
  # def destroy
  #   order.books.delete(order.book_id=book.id)
  # end

end
