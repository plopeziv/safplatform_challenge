# <p align="center" style="padding-top:20px">Ruby Command Line Calculator</p>

## Project Overview

This is a command-line Ruby application that calculates sales taxes for purchased items and prints a detailed receipt. The receipt includes a summary of all items entered, the total sales taxes applied, and the final purchase total. Users can add items interactively through command-line prompts.

To encourage good development practices, the application includes an RSpec test suite to ensure correctness and maintain application stability.

## Installation

To set up and run the project locally, follow these steps:

1. **Clone the Repository**

```
git clone https://github.com/plopeziv/safplatform_challenge.git
```

2. **Install Dependencies**

```
bundle install
```

## Getting Started

### Run the project

At the top of the project run the following command.

```
ruby main.rb
```

### Testing

#### Run tests

Run Test Suite

```
bundle exec rspec
```

Run Specific file

```
bundle exec rspec spec/relative_file_spec.rb
```

## Game Rules

This game is a command-line shopping cart calculator that guides the user through a series of prompts to build and finalize a purchase. Users will be asked to input item details, including:

- Item name

- Whether the item is exempt (e.g., book, food, or medical product)

- Whether the item is imported

- Item price

The calculator will handle all tax computations automatically. After each item is added, the user will be prompted to add another item or proceed to checkout. When the user finishes their cart, a summary of the items and a final receipt—including calculated taxes—will be displayed.

### Tax Rules

1. Sales tax on all goods is 10%
2. Books, food, and medical products are exempt from sales tax
3. Import taxes is an additional tax applicable to imported goods at 5%.
4. There are no exemptions for the import tax
5. Tax rate is rounded up to the nearest $0.05. This is done at a per item basis.

Some sample inputs and outputs can be seen below!

### Sample Inputs

#### Input 1:

```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

#### Input 2:

```
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
```

#### Input 3:

```
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
```

### Sample Outputs

#### Output 1:

```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

#### Output 2:

```
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
```

#### Output 3:

```
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```
