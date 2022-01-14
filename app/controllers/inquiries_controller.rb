class InquiriesController < ApplicationController
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
    inquiry_params = params.require(:inquiry).permit(:name, :email, :title, :text)
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      redirect_to inquiries_path
    else
      render 'new'
    end
  end
end
