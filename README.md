# COUP Challenge

## Design considerations
Ruby was the language of choice because of it opens source libraries(or gems),
its community, and lastly because of the present developer's strength with the language.
Then, in order to quickly build a Rack based api the Sinatra framework was chosen for
its quick setup and simplicity.  The design mainly aimed at solving the
problem at hand, but to also keep future extensibility and change in mind.

Since this is an HTTP API, JSON was chosen as the request/response
format, mainly to help ensure uniformity and standardization as the application grows.

## Solution strategy
In order to find the minimum number of Fleet Engineers (FE) needed: First, we find the district
where the Fleet Manager's (FM) presence would reduce the need for FEs the most.
To that district we assign the FM. Then, we calculate how many FEs are still necessary
to perform maintenance on the remaining scooters.

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

Then, launch app (e.g. on port 4567):
```
rackup -p 4567
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
