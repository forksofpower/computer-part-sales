class CartsController < ApplicationController
    before_action :find_cart, except: [:index, :new, :create]
    before_action :find_listing, only: [:add_listing, :remove_listing]
    skip_before_action :authorized, only: [:add_listing, :remove_listing]

    def index
        @carts = Cart.all
    end

    def show
    end

    def edit
    end

    def add_listing
        # need to prevent duplicates
        if !@cart.listings.include?(@listing)
            @cart.listings << Listing.find(params[:listing_id])
        
            if @cart.save
                # binding.pry
                redirect_to listing_path(@listing)
            else
                # 
            end
        else
            redirect_to listing_path(@listing)
        end
    end

    def remove_listing
        if @cart.listings.include?(@listing)
            @cart.listings -= [@listing]
            if @cart.save
                redirect_to listing_path(@listing)
            else
                # 
            end
        else
            redirect_to listing_path(@listing)
        end
    end

    private
        def cart_params
            params.require(:cart).permit(:complete, :user_id, :listing_ids)
        end

        def find_listing
            @listing = Listing.find(params[:listing_id])
        end

        def find_cart
            if params[:cart_id]
                @cart = Cart.find(params[:cart_id])    
            else
                @cart = Cart.find(params[:id])
            end
        end
end