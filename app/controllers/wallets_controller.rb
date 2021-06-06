class WalletsController < ApplicationController
  before_action :load_wallet, only: [:edit, :update, :destroy]

  def index
    @wallets = Wallet.all
  end

  def new
    @wallet = Wallet.new
  end

  def create
    @wallet = Wallet.new wallet_params

    if @wallet.save
      flash[:success] = "Created successfully"

      redirect_to wallets_path
    else
      flash.now[:failed] = "Can not create"

      render :new
    end
  end

  def edit; end

  def update
    if @wallet.update wallet_params
      flash[:success] = "Updated successfully"

      redirect_to wallets_path
    else
      flash.now[:failed] = "Can not update"

      render :edit
    end
  end

  def destroy
    if @wallet.destroy
      flash[:success] = "Destroyed"
    else
      flash[:failed] = "Can not destroy"
    end
    redirect_to wallets_path
  end

  private

  def wallet_params
    params.require(:wallet).permit(:owner_name, :type)
  end

  def load_wallet
    @wallet = Wallet.find(params[:id])
  end
end
