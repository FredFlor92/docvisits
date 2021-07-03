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
       set_docvisit
    end 

    def edit 
        set_docvisit
    end

    def update
        set_docvisit
        if @docvisit.update(docvisit_params)
            redirect_to docvisit_path(@docvisit)
        else 
            render :edit
        end   
    end 

    def destroy
        set_docvisit
        @docvisit.destroy
        redirect_to docvisit_path 
    end 
    private

    def set_docvisit
        @docvisit = Docvisit.find_by(id: params[:id])
        if !@docvisit
            redirect_to docvisits_path
        end 
    end 

    def docvisit_params
        params.require(docvisit).permit(:name, :sex, :date_of_birth, :appointment_time)
    end 


end