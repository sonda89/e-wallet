class DepositTransactionsController < ApplicationController
  def new
    @transaction = Transaction.deposit.new
  end

  def create
    @transaction = Transaction.deposit.new deposit_params

    if @transaction.save
      flash[:success] = "Transaction is created successfully."
      @transaction.exec

      redirect_to transactions_path
    else
      flash.now[:failed] = "Can not create transaction."
      render :new
    end
  end

  private

  def deposit_params
    params.require(:transaction).permit(
      :target,
      :amount
    )
  end
end
