class ElectronicsController < ApplicationController
    before_action :set_electronic, only: [:update, :destroy, :show, :edit]
    def index
        @electronics = Electronic.all
    end

    def new 
        @electronic = Electronic.new
    end

    
    def create
        @electronic = Electronic.new(electronic_params)
        if @electronic.save
            redirect_to electronics_path, notice: "Electronics created!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit

    end

    def update 
        if @electronic.update(electronic_params)
            redirect_to electronics_path, notice: "Electronics updated!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @electronic.destroy
        

        respond_to do |format|
            format.html{ redirect_to electronics_path, notice: "Electronics destroyed!" }
            format.turbo_stream
        end
    end

    private 

    def set_electronic
        @electronic = Electronic.find(params[:id])
    end

    def electronic_params
        params.require(:electronic).permit(:name, :price)
    end
end
