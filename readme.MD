# Twitter Raffler

A simple twitter raffler that will select a number of Twitter user that tweeted a certain phrase.
 
## Configuration

 * Create a new Twitter app [https://apps.twitter.com/](https://apps.twitter.com/) and generate an access token in the API key tab.  
 * Rename the `config.rb.example` to `config.rb` and fill it up with your twitter app information.
 * Change the query and the amount of winners in `config.rb`
 * Installing required gems by running `bundle install`
   
## Running

To run the raffle just run the `raffle.rb` script.  
This will search Twitter for the search query given and return X uniq winners.  
The raffler also returns X runner ups - in case your winners are not available.


