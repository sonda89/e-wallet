class WithdrawTransactionsController < ApplicationController
  def new
    @transaction = Transaction.withdraw.new
  end

  def create
    @transaction = Transaction.withdraw.new withdraw_params

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

  def withdraw_params
    params.require(:transaction).permit(
      :source,
      :amount
    )
  end
end
