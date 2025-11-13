class TransactionsController < ApplicationController
  before_action :set_property
  before_action :set_transaction, only: [:edit, :update, :destroy]

  def index
    @transactions = @property.transactions.order(date: :desc)
  end

  def new
    @transaction = @property.transactions.build
  end

  def create
    @transaction = @property.transactions.build(transaction_params)
    
    if @transaction.save
      redirect_to property_transactions_path(@property), notice: "Transaction was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to property_transactions_path(@property), notice: "Transaction was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
    redirect_to property_transactions_path(@property), notice: "Transaction was successfully deleted."
  end

  private

  def set_property
    @property = Current.user.properties.find(params[:property_id])
  end

  def set_transaction
    @transaction = @property.transactions.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :category, :amount, :date, :description)
  end
end
