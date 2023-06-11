Sample API application created with Ruby on Rails.
Will return restaurants with a "Lord of the Rings" fantasy theme.

Usage:

SHOW
curl -s http://localhost:3000/api/v1/restaurants/1 | jq

CREATE
curl -i -X POST                                                              \
     -H 'Content-Type: application/json'                                     \
     -H 'X-User-Email: you@email.org'                                      \
     -H 'X-User-Token: abcdefghijklmnop'                                 \
     -d '{ "restaurant": { "name": "New restaurant", "address": "Tokyo" } }' \
     http://localhost:3000/api/v1/restaurants


uses pundit, devise, faker, simple_token_authentication
