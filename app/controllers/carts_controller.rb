class CartsController < ApplicationController
    before_action :find_cart, except: [:index, :new, :create, :show, :checkout, :complete]
    before_action :find_listing, only: [:add_listing, :remove_listing]
    skip_before_action :authorized, only: [:add_listing, :remove_listing]

    def index
        @carts = Cart.all
    end

    def show
        # check if authorized
        # get current_user.current_cart
        @cart = current_user.current_cart
    end

    def checkout
        # set cart.complete = true
        # iterate through listings
        #   set listing.available = false
        #   create transaction for listing
        @cart = current_user.current_cart

        if !@cart.listings.empty?
            @cart.complete = true

            @cart.listings.each do |listing|
                # create transaction
                # buyer, seller, cart, part
                transaction = Transaction.new({
                    cart: @cart,
                    part: listing.part,
                    buyer: current_user,
                    seller: listing.user,
                    price: listing.price, 
                    condition: listing.condition
                })

                # transfer part ownership
                listing.part.user = current_user
                listing.part.save
                # delete listing
                listing.delete

                transaction.save
                # binding.pry
                
                redirect_to checkout_complete_path
            end
        end
    end

    def complete
    end

    def add_listing
        # need to prevent duplicates
        if !@cart.listings.include?(@listing)
            @cart.listings << Listing.find(params[:listing_id])
        
            if @cart.save
                # binding.pry
                redirect_to current_user_cart_path
            else
                # 
            end
        end
    end

    def remove_listing
        if @cart.listings.include?(@listing)
            @cart.listings -= [@listing]
            if @cart.save
                redirect_to current_user_cart_path
            else
                # 
            end
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