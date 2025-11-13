# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create demo user
user = User.find_or_create_by!(email: "demo@louer.co") do |u|
  u.password = "password123456"
  u.verified = true
end

puts "Created demo user: demo@louer.co / password123456"

# Create sample properties
property1 = user.properties.find_or_create_by!(name: "Sunset Apartments") do |p|
  p.address = "123 Main St, San Francisco, CA 94102"
  p.property_type = "Multi-Family"
  p.purchase_price = 850000
  p.purchase_date = 2.years.ago
end

property2 = user.properties.find_or_create_by!(name: "Oak Street Condo") do |p|
  p.address = "456 Oak St, San Francisco, CA 94117"
  p.property_type = "Condo"
  p.purchase_price = 650000
  p.purchase_date = 1.year.ago
end

property3 = user.properties.find_or_create_by!(name: "Downtown Office Space") do |p|
  p.address = "789 Market St, San Francisco, CA 94103"
  p.property_type = "Commercial"
  p.purchase_price = 1200000
  p.purchase_date = 6.months.ago
end

puts "Created 3 sample properties"

# Create sample transactions for property1
6.times do |i|
  month = i.months.ago
  
  # Rent income
  property1.transactions.find_or_create_by!(
    transaction_type: "income",
    category: "Rent",
    date: month.beginning_of_month + 1.day
  ) do |t|
    t.amount = 4500
    t.description = "Monthly rent payment"
  end
  
  # Mortgage payment
  property1.transactions.find_or_create_by!(
    transaction_type: "expense",
    category: "Mortgage",
    date: month.beginning_of_month + 1.day
  ) do |t|
    t.amount = 3200
    t.description = "Monthly mortgage payment"
  end
  
  # Property tax (quarterly)
  if i % 3 == 0
    property1.transactions.find_or_create_by!(
      transaction_type: "expense",
      category: "Property Tax",
      date: month.beginning_of_month + 15.days
    ) do |t|
      t.amount = 2500
      t.description = "Quarterly property tax"
    end
  end
  
  # Insurance (annual)
  if i == 0
    property1.transactions.find_or_create_by!(
      transaction_type: "expense",
      category: "Insurance",
      date: month.beginning_of_month + 10.days
    ) do |t|
      t.amount = 1200
      t.description = "Annual property insurance"
    end
  end
  
  # Occasional maintenance
  if [1, 3, 5].include?(i)
    property1.transactions.find_or_create_by!(
      transaction_type: "expense",
      category: "Maintenance",
      date: month.beginning_of_month + 20.days
    ) do |t|
      t.amount = rand(200..800)
      t.description = "General maintenance and repairs"
    end
  end
end

# Create sample transactions for property2
4.times do |i|
  month = i.months.ago
  
  # Rent income
  property2.transactions.find_or_create_by!(
    transaction_type: "income",
    category: "Rent",
    date: month.beginning_of_month + 1.day
  ) do |t|
    t.amount = 3200
    t.description = "Monthly rent payment"
  end
  
  # HOA Fees
  property2.transactions.find_or_create_by!(
    transaction_type: "expense",
    category: "HOA Fees",
    date: month.beginning_of_month + 1.day
  ) do |t|
    t.amount = 450
    t.description = "Monthly HOA fees"
  end
  
  # Mortgage payment
  property2.transactions.find_or_create_by!(
    transaction_type: "expense",
    category: "Mortgage",
    date: month.beginning_of_month + 1.day
  ) do |t|
    t.amount = 2400
    t.description = "Monthly mortgage payment"
  end
end

# Create sample transactions for property3
3.times do |i|
  month = i.months.ago
  
  # Rent income
  property3.transactions.find_or_create_by!(
    transaction_type: "income",
    category: "Rent",
    date: month.beginning_of_month + 1.day
  ) do |t|
    t.amount = 7500
    t.description = "Monthly commercial rent"
  end
  
  # Property management
  property3.transactions.find_or_create_by!(
    transaction_type: "expense",
    category: "Property Management",
    date: month.beginning_of_month + 5.days
  ) do |t|
    t.amount = 750
    t.description = "Property management fee (10%)"
  end
  
  # Utilities
  property3.transactions.find_or_create_by!(
    transaction_type: "expense",
    category: "Utilities",
    date: month.beginning_of_month + 10.days
  ) do |t|
    t.amount = rand(400..600)
    t.description = "Monthly utilities"
  end
end

puts "Created sample transactions for all properties"
puts "\nDemo account credentials:"
puts "Email: demo@louer.co"
puts "Password: password123456"
