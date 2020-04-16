class PartsController < ApplicationController
    before_action :find_part, except: [:index, :new, :create]
    before_action :find_part_listing, only: [:index, :edit]
    # skip_before_action :authorized, only: [:new, :create]

    def index
        @parts = Part.all
    end

    def show
        @listing = Listing.find_by(part_id: @part.id)
    end

    def new
        @part = Part.new
    end

    def edit
    end

    def create
        @part = Part.new(part_params)
        @part.user_id = 1
        # set part owner to current_user
        # on new part, create new listing
        if @part.validates?
        #   flash[:success] = "Part successfully created"
          @part.save

          redirect_to @part
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def update
        if @part.update_attributes(part_params)
          flash[:success] = "Part was successfully updated"
          redirect_to @part
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        if @part.destroy
            flash[:success] = "Part was successfully deleted"
            redirect_to parts_path
        else
            flash[:error] = "Something went wrong"
            redirect_to parts_path
        end
    end

    private
        def part_params
            params.require(:part).permit(:name, :manufacturer, :description, :model, :condition, :category, :price, :available)
        end

        def find_part_listing
            @listing = Listing.find_by(part_id: params[:id])
        end

        def find_part
            @part = Part.find(params[:id])
        end
end