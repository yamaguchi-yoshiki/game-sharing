class Public::CustomersController < ApplicationController
  before_action :authenticate_admin_customer, only: [:edit, :update, :quit_check, :withdraw]
  before_action :ensure_guest_customer, only: [:edit, :update]

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path, notice: "会員情報を更新しました"
    else
      render "edit"
    end
  end

  def quit_check
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    if @customer.update(is_active: false)
      reset_session
      redirect_to root_path, notice: "退会しました"
    else
      render "quit_check"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :email, :is_active)
  end

  def ensure_guest_customer
    if customer_signed_in?
      @customer = current_customer
      if @customer.email == "guest@example.com"
        redirect_to customer_path(@customer) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
      end
    end
  end
end
