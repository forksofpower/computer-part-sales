class PartsController < ApplicationController
    before_action :find_part, except: [:index, :new, :create]

    def index
        @parts = Part.all
    end

    def show
    end

    def new
        @part = Part.new
    end

    def edit
    end

    def create
        @part = Part.new(part_params)
        if @part.save
        #   flash[:success] = "Part successfully created"
          redirect_to @part
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def update
        if @part.update_attributes(part_params)
        #   flash[:success] = "Part was successfully updated"
          redirect_to @part
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        if @part.destroy
            # flash[:success] = "Part was successfully deleted"
            redirect_to @parts_path
        else
            flash[:error] = "Something went wrong"
            redirect_to @parts_path
        end
    end

    private

        def part_params
            params.require(:part).permit(:name)
        end

        def find_part
            @part = Part.find(params[:id])
        end

end
