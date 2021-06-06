class TransferTransactionsController < ApplicationController
  def new
    @transaction = Transaction.transfer.new
  end

  def create
    @transaction = Transaction.transfer.new transfer_params

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

  def transfer_params
    params.require(:transaction).permit(
      :target,
      :source,
      :amount
    )
  end
end
