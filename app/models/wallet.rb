class Wallet < ApplicationRecord
  WALLET_TYPES = ["Team", "User", "Stock"]

  has_many :withdraw_transactions, -> { withdraw }, foreign_key: :source, class_name: "Transaction"
  has_many :deposit_transactions, -> { deposit }, foreign_key: :target, class_name: "Transaction"
  has_many :received_transfer_transactions, -> { transfer }, foreign_key: :target, class_name: "Transaction"
  has_many :sent_transfer_transactions, -> { transfer }, foreign_key: :source, class_name: "Transaction"

  validates_presence_of :owner_name, :balance
  validates :balance, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
end
