class ListingsController < ApplicationController
    before_action :find_listing, except: [:new, :index, :create]
    before_action :find_part, only: [:show, :new, :create]
    skip_before_action :authorized, only: [:index, :show]


    def new
        @listing = Listing.new
    end

    def index
        @listings = Listing.all
    end

    def show
    end

    def edit
    end

    def create
        # check for user allowed
        @listing = Listing.new(listing_params)
        @listing.user = current_user
        @listing.part = @part

        binding.pry
        if @listing.valid?
            # flash[:success] = "Listing successfully created"
            @listing.save
            redirect_to @listing
        else
            # flash[:error] = "Something went wrong"
            # provide the part for the listings form
            flash[:error] = @listing.errors.full_messages
            redirect_to new_part_listing_path(@part)
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
            params.require(:listing).permit(:condition, :price)
        end

        def find_listing
            @listing = Listing.find(params[:id])
        end

        def find_part
            @part = (params[:part_id]) ? Part.find(params[:part_id]) : @listing.part
        end
end