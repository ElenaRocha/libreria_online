class ShopingsController < ApplicationController

  # GET /shoping
  def show
    @order = Order.where(user_id: Current.user.id).to_a
  end

  # GET /shoping/:id
  def index
    if Current.user.present?
      if Current.user.orders.any? { |order| order.state == "activo"}
        @order = Order.where(user_id: Current.user.id, state: "activo").to_a.last
        @book = Book.find(params[:id])
        @order.books << @book
      else
        @book = Book.find(params[:id])
        @order = Current.user.orders.create(state: "activo")
        @order.books << @book
      end
    else
      flash[:alert] = "You have to sign in or register first"
      redirect_to sessions_path
    end
  end

  # DELETE /shoping
  def destroy
    ActiveRecord::Base.connection.exec_query("DELETE FROM `books_orders` WHERE `books_orders`.`order_id` = #{params[:order_id]} AND `books_orders`.`book_id` = #{params[:book_id]} LIMIT 1")
    respond_to do |format|
      format.js
      # format.js {render}
    end
    # redirect_to order_path(:id => params[:order_id])
  end

  # POST /shoping/finish/:id
  def finish
    @order = Order.find(params[:id])
    @order.state = "finalizado"
    @order.save
    redirect_to shoping_path
  end

end
