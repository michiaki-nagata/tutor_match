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
    inquiry_params = params.require(:inquiry).permit(:name, :email, :title, :text ,:answer)
    @inquiry = Inquiry.create(inquiry_params)
    redirect_to inquiries_path
  end
end
