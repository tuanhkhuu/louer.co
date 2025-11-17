class PropertiesController < ApplicationController
  before_action :set_property, only: [ :show, :edit, :update, :destroy ]

  def index
    @properties = Current.user.properties.order(created_at: :desc)
  end

  def show
    @transactions = @property.transactions.order(date: :desc).limit(10)
  end

  def new
    @property = Current.user.properties.build
  end

  def create
    @property = Current.user.properties.build(property_params)

    if @property.save
      redirect_to @property, notice: "Property was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: "Property was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_url, notice: "Property was successfully deleted."
  end

  private

  def set_property
    @property = Current.user.properties.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :address, :property_type, :purchase_price, :purchase_date)
  end
end
