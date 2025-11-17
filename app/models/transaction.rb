class Transaction < ApplicationRecord
  belongs_to :property

  validates :transaction_type, presence: true, inclusion: { in: %w[income expense] }
  validates :category, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true

  INCOME_CATEGORIES = [ "Rent", "Late Fees", "Parking", "Storage", "Pet Rent", "Other Income" ].freeze
  EXPENSE_CATEGORIES = [ "Mortgage", "Insurance", "Property Tax", "HOA Fees", "Repairs", "Maintenance",
                        "Utilities", "Property Management", "Legal Fees", "Advertising", "Other Expense" ].freeze

  scope :income, -> { where(transaction_type: "income") }
  scope :expenses, -> { where(transaction_type: "expense") }
  scope :for_month, ->(date) { where(date: date.beginning_of_month..date.end_of_month) }
  scope :for_year, ->(date) { where(date: date.beginning_of_year..date.end_of_year) }
end
