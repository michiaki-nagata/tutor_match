class Student::InquiriesController < ApplicationController
    
    def index
        @inquiries = Inquiry.all
    end
    
    def show
        @inquiry = Inquiry.find(params[:id])
    end
        
    def new
        @inquiry = Inquiry.new
    end
    
    def create
        inquiry_params = params.require(:inquiries).permit(:name, :email, :title, :text)
        @inquiry = Inquiry.new(inquiry_params)
        if @inquiry.save
            redirect_to student_inquiries_path
        else
            render "new"
        end
    end
    

end