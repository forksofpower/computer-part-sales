class ListingsController < ApplicationController
    before_action :find_listing, except: [:index, :new, :create]

    def index
        @listings = Listing.all
    end

    def show
    end

    def new
        if !!params[:part_id]
            @listing = Listing.new(part_id: params[:part_id])
            @part = Part.find(params[:part_id])
        else
            redirect_to listings_path
        end
    end

    def edit
    end

    def create
        # check for user allowed
        @listing = Listing.new(listing_params)
        @listing.user_id = 1

        if @listing.save
            # flash[:success] = "Listing successfully created"
            redirect_to @listing
        else
            # flash[:error] = "Something went wrong"
            # provide the part for the listings form
            @part = Part.find(params[:listing][:part_id])
            render 'new', part_id: @listing.part_id
        end
    end

    def update
        if @listing.update_attributes(listing_params)
          flash[:success] = "Listing was successfully updated"
          redirect_to @listing
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        if @listing.destroy
            flash[:success] = "Listing was successfully deleted"
            redirect_to listings_path
        else
            flash[:error] = "Something went wrong"
            redirect_to listings_path
        end
    end

    private
        def listing_params
            params.require(:listing).permit(:condition, :price, :part_id)
        end

        def find_listing
            @listing = Listing.find(params[:id])
        end
end