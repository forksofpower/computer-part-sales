class CartsController < ApplicationController
    before_action :find_cart, except: [:index, :new, :create]

    def index
        @carts = Cart.all
    end

    def show
    end

    # def new
    #     @cart = Cart.new
    # end

    def edit
    end

    # def create
    #     @cart = Cart.new(cart_params)
    #     if @cart.save
    #       flash[:success] = "Cart successfully created"
    #       redirect_to @cart
    #     else
    #       flash[:error] = "Something went wrong"
    #       render 'new'
    #     end
    # end

    # def update
    #     if @cart.update_attributes(cart_params)
    #       flash[:success] = "Cart was successfully updated"
    #       redirect_to @cart
    #     else
    #       flash[:error] = "Something went wrong"
    #       render 'edit'
    #     end
    # end

    # def destroy
    #     if @cart.destroy
    #         flash[:success] = "Cart was successfully deleted"
    #         redirect_to carts_path
    #     else
    #         flash[:error] = "Something went wrong"
    #         redirect_to carts_path
    #     end
    # end

    def add_listing
        # shuffle in the new listing id and redirect to the referring page
        # need to prevent duplicates
        @cart.listing_ids << params[:listing_id].to_i
        # @cart.listings << Listings.find_by(params[:listing_id])
        @cart.save
        # if 
        #     redirect_to cart_path
        # else
        #     binding.pry
        # end
    end

    def remove_listing

    end

    private
        def cart_params
            params.require(:cart).permit(:complete, :user_id, :listing_ids)
        end

        def find_listing
            @listing = Listing.find(params[:listing_id])
        end

        def find_cart
            @cart = Cart.find(params[:id])
        end
end