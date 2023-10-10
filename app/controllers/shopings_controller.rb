class ShopingsController < ApplicationController

  # GET /shoping
  def index
    if Current.user.orders
      @order = Order.where(user_id: Current.user.id, state: "pending").to_a.last
    # else
    #   new
    #   show
    end
  end

  # POST /shoping
  def new
    @order = Order.new(:user_id, :state)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
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