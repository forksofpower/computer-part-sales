class CartsController < ApplicationController
    before_action :find_cart, except: [:index, :new, :create]

    def index
        @carts = Cart.all
    end

    def show
    end

    def new
        @cart = Cart.new
    end

    def edit
    end

    def create
        @cart = Cart.new(cart_params)
        if @cart.save
          flash[:success] = "Cart successfully created"
          redirect_to @cart
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def update
        if @cart.update_attributes(cart_params)
          flash[:success] = "Cart was successfully updated"
          redirect_to @cart
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        if @cart.destroy
            flash[:success] = "Cart was successfully deleted"
            redirect_to carts_path
        else
            flash[:error] = "Something went wrong"
            redirect_to carts_path
        end
    end

    private
        def cart_params
            params.require(:cart).permit(:complete, :user_id, :part_ids)
        end

        def find_cart
            @cart = Cart.find(params[:id])
        end
end