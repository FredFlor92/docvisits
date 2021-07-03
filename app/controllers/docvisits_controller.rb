class DocvisitsController < ApplicationController

    def new
        @docvisit = Docvisit.new
    end 

    def create
        @docvisit = Docvisit.new(docvisit_params)

        if @docvisit.save
            redirect_to docvisit_path(@docvisit)
        else
            render :new
        end
    end 
    
    def index
        @docvisits = Docvisit.all
    end 

    def show
        @docvisit = Docvisit.find_by(id: params[:id])
        if !@docvisit
            redirect_to docvisits_path
        end 
    end 

    private

    def docvisit_params
        params.require(docvisit).permit(:name, :sex, :date_of_birth, :appointment_time)
    end 


end