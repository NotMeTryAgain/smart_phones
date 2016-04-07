### Introduction

Today, you're going to write an application for a local "L-Mobile" Phone dealer.

### Getting Set Up

Run the following commands to create a new Rails app...

```no-highlight
$ rails new . --database=postgresql -T
$ bundle
$ rake db:create
```
  
You will need to follow the directions in the documentation for setting up [rspec-rails](https://github.com/rspec/rspec-rails) and [capybara](https://github.com/jnicklas/capybara) so that you will be able to write feature specs for your application.

### Requirements Necessary to Meet Expectations

Test drive your development by writing acceptance tests for the following user stories and getting the tests to pass to complete the acceptance criteria for each feature.

```no-highlight
As a Smart Phone dealer
I want to record different phone operating systems
So that I can keep track of the types of phones that I can sell
```

Acceptance Criteria:

* I must specify an OS name.
* If I do not give the specified info, I see errors.
* If I specify the required information, the OS is recorded and I am redirected to the index of available operating systems.

```no-highlight
As a Smart Phone Dealer
I want to record a new Cell Phone Model
So that I can list it in my store
```

Acceptance Criteria:

* I must specify the manufacturer, screen size, OS, and charging port, and model name.
* I can also set the "Quanitiy" of current phones in stock of this model (minimum: 0).
* If I enter all of the required information in the required formats, I get a notice of my success!
* If I do not specify all of the required information in the required formats, the phone is not recorded and I am presented with errors.
* Upon successfully creating a phone, I am directed to the index page for phones.

```no-highlight
As a shopper
I would like to see phones that are in-stock
So that I know what phones are available to buy!
```

Implement a method on the Cell phone model that reports whether or not there is any stock remaining of the given cell phone model. Then, modify the index page to show an indicator ("In Stock!") if available, and ("Not Available") if not.


### Exceeding Expectations Requirements

Write tests for the following user stories and the code to make them pass.

```no-highlight
As a cell phone shopper
I want to search for specific phones
So that I can buy one that matches my criteria
```

Acceptance Criteria:

* There is a search form for phones on the phones index.
* I can specify the manufacturer, screen size, OS, charging port, and model name.
* You should only be able to select Operating Systems added to our DB.
* There should be a dropdown, allowing the user to select:
 - The OS
 - Screen Size
 - Manufacturer
 - Charging Port

 The options for these dropdowns should be constrained to the options available in the database.
* If I submit the form without specifying anything, I should see all phone models.
* If I submit the form with certain specifications, I should only see phones that fit those specifications.
