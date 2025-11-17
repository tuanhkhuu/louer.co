# Louer.co - Property Finance Tracker

A comprehensive property finance management web application similar to Stessa, built with Rails 8, PostgreSQL, TailwindCSS, and Hotwire.

## Features

- 🏠 **Property Management** - Track multiple properties with detailed information
- 💰 **Income & Expense Tracking** - Record rental income and expenses by category
- 📊 **Portfolio Dashboard** - View portfolio-wide financial metrics and performance
- 💵 **Cash Flow Analysis** - Monitor cash flow and ROI for each property
- 🔒 **Secure Authentication** - User authentication powered by authentication-zero
- 📱 **Responsive Design** - Mobile-friendly interface built with TailwindCSS
- ⚡ **Real-time Updates** - Dynamic interactions with Hotwire (Turbo & Stimulus)

## Tech Stack

- **Backend**: Ruby on Rails 8.1.1
- **Database**: PostgreSQL
- **Frontend**: TailwindCSS 4 + Hotwire (Turbo/Stimulus)
- **Authentication**: authentication-zero
- **Asset Pipeline**: Propshaft + Importmap

## Getting Started

### Prerequisites

- Ruby 3.2.3
- PostgreSQL 14+
- Node.js (for JavaScript dependencies)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/tuanhkhuu/louer.co.git
cd louer.co
```

2. Install dependencies:
```bash
bundle install
```

3. Setup database:
```bash
rails db:create db:migrate db:seed
```

4. Start the development server:
```bash
bin/dev
```

5. Visit http://localhost:3000

### Demo Account

You can login with the demo account:
- **Email**: demo@louer.co
- **Password**: password123456

The demo account includes 3 sample properties with transaction history.

## Usage

### Managing Properties

1. After signing in, navigate to the Properties page
2. Click "Add Property" to create a new property
3. Fill in property details including name, type, address, purchase price, and date
4. View property details including financial metrics

### Tracking Transactions

1. Open a property detail page
2. Click "Add Transaction" to record income or expenses
3. Select transaction type (Income or Expense)
4. Choose a category and enter amount and date
5. View transaction history and summary on the property page

### Dashboard

The dashboard provides an overview of your entire portfolio:
- Total number of properties
- Total portfolio value
- Total income and expenses
- Net cash flow across all properties
- Recent transactions
- Quick access to all properties

## Development

### Running Tests

```bash
rails test
rails test:system
```

### Code Quality

```bash
bin/rubocop        # Run RuboCop linter
bin/brakeman       # Run security scanner
bin/bundler-audit  # Check for vulnerable dependencies
```

### Database Schema

Key models:
- `User` - User accounts with secure authentication
- `Property` - Real estate properties with financial details
- `Transaction` - Income and expense records linked to properties

## Deployment

The application includes Docker configuration and Kamal setup for easy deployment.

```bash
kamal setup
kamal deploy
```

## License

This project is available as open source under the terms of the MIT License.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
