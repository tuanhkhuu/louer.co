class Property < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :property_type, presence: true
  validates :purchase_price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  PROPERTY_TYPES = ["Single Family", "Multi-Family", "Condo", "Townhouse", "Commercial", "Land", "Other"].freeze

  def total_income
    transactions.where(transaction_type: "income").sum(:amount)
  end

  def total_expenses
    transactions.where(transaction_type: "expense").sum(:amount)
  end

  def net_cash_flow
    total_income - total_expenses
  end

  def roi
    return 0 if purchase_price.nil? || purchase_price.zero?
    (net_cash_flow / purchase_price * 100).round(2)
  end
end
