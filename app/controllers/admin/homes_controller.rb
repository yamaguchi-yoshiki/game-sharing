class Admin::HomesController < Admin::ApplicationController
  def top
    @customers = Customer.page(params[:page])
  end
end
