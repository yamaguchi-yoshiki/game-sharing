class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.page(params[:page])
  end
end
