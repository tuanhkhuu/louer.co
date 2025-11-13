class DashboardController < ApplicationController
  def index
    @properties = Current.user.properties.includes(:transactions)
    @total_properties = @properties.count
    @total_value = @properties.sum(:purchase_price) || 0
    
    # Calculate totals across all properties
    all_transactions = Transaction.joins(:property).where(properties: { user_id: Current.user.id })
    @total_income = all_transactions.income.sum(:amount)
    @total_expenses = all_transactions.expenses.sum(:amount)
    @net_cash_flow = @total_income - @total_expenses
    
    # Recent transactions
    @recent_transactions = all_transactions.order(date: :desc).limit(10)
  end
end
