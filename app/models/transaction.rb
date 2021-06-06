class Transaction < ApplicationRecord
  belongs_to :source_wallet, foreign_key: :source, optional: true, class_name: "Wallet"
  belongs_to :target_wallet, foreign_key: :target, optional: true, class_name: "Wallet"

  enum transaction_type: { withdraw: 0, deposit: 1, transfer: 2 }
  enum status: { processing: 0, success: 1, failed: 2 }

  delegate :owner_name, to: :source_wallet, allow_nil: true, prefix: true
  delegate :owner_name, to: :target_wallet, allow_nil: true, prefix: true

  validates :source_wallet, presence: true, if: :source_wallet_required?
  validates :target_wallet, presence: true, if: :target_wallet_required?
  validates :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

  def exec
    Wallet.transaction do
      if source_wallet.present?
        source_wallet.assign_attributes(balance: source_wallet.balance - amount)
        source_wallet.save!
      end

      if target_wallet.present?
        target_wallet.assign_attributes(balance: target_wallet.balance + amount)
        target_wallet.save!
      end

      success!
    rescue StandardError => e
      update status: :failed, reason: e.message
    end
  end

  private

  def source_wallet_required?
    !deposit?
  end

  def target_wallet_required?
    !withdraw?
  end
end
