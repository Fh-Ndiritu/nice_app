class ElectronicsController < ApplicationController
    before_action :set_electronic, only: [:update, :destroy, :show, :edit]
    def index
        @electronics = current_store.electronics
    end

    def new 
        @electronic = Electronic.new
    end

    
    def create
        @electronic = current_store.electronics.build(electronic_params)
        if @electronic.save
            respond_to do |format| 
                format.html{ redirect_to electronics_path, notice: "Electronics created!"}
                format.turbo_stream{ flash.now[:notice] = "Electronics created!"}
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit

    end

    def update 
        if @electronic.update(electronic_params)
            respond_to do |format|
                format.html{ redirect_to electronics_path, notice: "Electronics updated!"}
                format.turbo_stream{ flash.now[:notice] = "Electronics updated!"}
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @electronic.destroy
        

        respond_to do |format|
            format.html{ redirect_to electronics_path, notice: "Electronics destroyed!" }
            format.turbo_stream{ flash.now[:notice] = "Electronics destroyed!" }
        end
    end

    private 

    def set_electronic
        @electronic = current_store.electronics.find(params[:id])
    end

    def electronic_params
        params.require(:electronic).permit(:name, :price)
    end
end
