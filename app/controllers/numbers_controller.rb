class NumbersController < ApplicationController
  # GET /numbers/new
  def new
    @number = Number.new
  end
  
  # GET /numbers/convert
  def convert
    @number = Number.new(params[:number])

    render action: 'new' unless @number.valid?
  end
end
