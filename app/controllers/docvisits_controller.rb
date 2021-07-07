class DocvisitsController < ApplicationController
    #before_action :check_for_if_logged_in, except: [:index]

    def new
        if params[:doctor_id] && @doctor = Doctor.find_by_id(params[:doctor_id])
        @doctor = docvisit.build_doctor
        else
        @docvisit = Docvisit.new
        end 
    end 

    def create
        @docvisit = current_user.docvisits.build(docvisit_params)

        if @docvisit.save
            redirect_to docvisit_path(@docvisit)
        else
            @docvisit.build_doctor unless @docvisit.doctor
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
        params.require(docvisit).permit(:name, :password, )
    end 


end