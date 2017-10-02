# COUP Challenge

## Design considerations
Ruby was the language of choice because of it opens source libraries(or gems),
its community, and lastly because of the present developers strength with the language.
Then, in order to quickly build a Rack based api the Sinatra framework was chosen for
its quick setup and simplicity.  The design mainly aimed at solving the
problem at hand, but to also keep future extensibility and change in mind.

Since this is an HTTP API, JSON was chosen as the request/response
format, mainly to help ensure uniformity and standardization as the application grows.

## Notes:
Using JSON as the request/response format implied slight changes to the formatting
of the inputs in the challenge documentation, like adding quotes to the keys.

## Future improvements:
Given more time, it would be worthwhile to add tests to this application.
Further, given more requirements and information on the product, some more
thought will have to be put into the structure of the application as it grows.

## Getting Started:
To run, first do:
```
bundle install
```

Then:
```
ruby app.rb
```

## Example:
The endpoint:
```
post  '/scooters'
```

and a request with the body:
```ruby
{ "scooters": [15, 10],
  "C": 12,
  "P": 5 }
```

gets the response:
```ruby
{ "fleet_engineers" : 3 }
```
