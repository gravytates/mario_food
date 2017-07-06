# Mario's Specialty Food Products

![screenshot1](https://user-images.githubusercontent.com/25161777/27757919-84fb754c-5dbd-11e7-9f44-f092722b293e.png)


[Visit the site!](https://marios-food-products.herokuapp.com/)

This is a website for Mario's customers to view his products. Built for the Rails week one independent project, Mario's site features bcrypt authentication to add/edit/delete products and reviews, custom scopes, callbacks, simpleCov, factory girl, and validations. The database is seeded with the chuck norris quotes written by superheroes via the faker gem. This site is well suited to show off all of Mario's potential products and allows customers with authenticated profiles to interact via writing reviews and rating the products themselves.

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

* Ruby 2.4.1
* Bundler

### Installing

Clone this repo by typing into the terminal:
```
$ git clone https://github.com/gravytates/mario_food.git
```

In a new terminal window, start postgres in the background:
```
$ postgres
```
Ensure you are using Ruby 2.4.1 by typing:
```
$ ruby -v
```

If you are not running version 2.4.1 please look into a Ruby version manager. I suggest RVM or Chruby.

Navigate to this project directory in the terminal. Then type:

```
$ bundle install
```

After the gems are installed set up the database:

```
$ bundle exec rails db:setup
```

To run the app:
```
$ bundle exec rails server
```
If all went well, rails will now make this project available in your browser by going to localhost:3000.

### Testing

This application includes both Unit and User Integration testing.  It primarily uses RSpec, Capybara, and Shoulda-Matchers.

## Screenshots

### Home

![home](https://user-images.githubusercontent.com/25161777/27840153-a1180420-60ab-11e7-8a5a-55c6752fb68a.png)


### Products

![products](https://user-images.githubusercontent.com/25161777/27840164-b336349c-60ab-11e7-8327-3a5b44d87fb1.png)

### Signing Up

![sign_up](https://user-images.githubusercontent.com/25161777/27840216-153dbf8e-60ac-11e7-9be6-e4e3fed7df6b.png)

### Product Page and Reviews

![details and reviews](https://user-images.githubusercontent.com/25161777/27758307-c1bde656-5dc5-11e7-8321-ef32fa952dab.png)


## Authors

* Grady Shelton

### Technologies Used

* Ruby
* Rails
* Bundler
* Postgres
* RSpec
* Javascript (ES6)
* Jquery 3
* HTML5
* SASS

## License

MIT License

Copyright (c) 2017 Grady Shelton

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
