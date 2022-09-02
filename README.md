# About
This project is the result of a challenge proposed by the company Agrisafe.
The project proposal is an API manages a "Shipping Company".

# Technology stack
This is monolith application using 
- ruby on rails ``6.1.6.1``
- ruby ``2.7.1``
- postgresql

# Database diagram
![shipping](https://github.com/ArcelinoNeto/shipping_company-api/blob/master/shipping.png)

## Set up

1. Clone the project
```
git clone https://github.com/derikbf/Quick-Orders.git
```
```
cd shipping_company
```
2. Install dependencies
``` 
bundle install
``` 

3. Database configuration 

To configure the database, run the command below
```
rails db:setup
```
To populate with data for testing run the command below
```
rails dev:setup
```


4. Start the project
```
rails s
```
