# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final project

Admin Products: add new one and delete 
!["Admin_allproducts"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/admin_allproduct.png?raw=true)

Admin Products: able to add product with new category 
!["Admin_newcategory"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/newproduct_newcategory.png?raw=true)

Admin Dashboard: total user and order shows
!["Admin_dashboard"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/admin_dashboard.png?raw=true)

Admin Categories: add new one 
!["Admin_category"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/admin_newcategory.png?raw=true)

Main: product index
!["main"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/product_index.png?raw=true)

Cart: able to see items
!["cart"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/cart.png?raw=true)

Empty cart page: friendly message with link to main page
!["emptycart"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/emptycart.png?raw=true)

Email: to be send to user
!["email"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/email_preview.png?raw=true)


Sign up: not able to sign up with same email
!["signup_existemail"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/existemail_signup.png?raw=true)

Log in: log in page
!["login"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/login.png?raw=true)

Log in: email or password is not valid
!["login"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/wrong_login.png?raw=true)

Log out: when user log out
!["logout"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/logout.png?raw=true)

Order: loggin user page
!["login_orderr"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/login_order.png?raw=true)

Order: visitor page
!["order_visitor"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/wologin_order.png?raw=true)

Product: loggin user page
!["product_login"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/login_product.png?raw=true)

Product: visitor page
!["product_visitor"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/visitor_product.png?raw=true)

Product: no review
!["no_review"](https://github.com/Ethenalee/jungle-rails/blob/master/screenshot/noreview_product.png?raw=true)




## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. put adming username and password into appropriate .env vars
10. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Email Preview
option 1. Run rails console in command line
After placing an order through http://localhost:3000, run the following in console: UserMailer.order_email(User.last, Order.last).deliver_now 
This should output an HTML code view to be sent to the user.
option 2. You can check test preview through http://localhost:3000/rails/mailers/user_mailer/order_email
(tested with first user, first order)


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
