# Sam Ruby API library

The Sam Ruby library provides convenient access to the Sam REST API from any Ruby 3.0+
application.

It is generated with [Stainless](https://www.stainlessapi.com/).

## Documentation

Documentation for the most recent version of this gem can be found [on RubyDoc](https://rubydoc.info/github/stainless-sdks/sam/sam-ruby).

The underlying REST API documentation can be found [on docs.elborai.software](https://docs.elborai.software).

## Installation

To use this gem during the beta, install directly from GitHub with Bundler by
adding the following to your application's `Gemfile`:

```ruby
gem "sam", git: "https://github.com/stainless-sdks/sam/sam-ruby", branch: "main"
```

To fetch an initial copy of the gem:

```sh
bundle install
```

To update the version used by your application when updates are pushed to
GitHub:

```sh
bundle update sam
```

## Usage

```ruby
require "sam"

sam = Sam::Client.new(
  auth_token: "My Auth Token" # defaults to ENV["MAVENAGI_AUTH_TOKEN"]
)

action_set = sam.action_sets.retrieve("abc123")
```

### Resources

Functionality in this library is organized around the resources exposed by the
Sam API. Methods on those resources correspond to endpoints on the API,
e.g.:

```ruby
card = sam.cards.create({
  account_id: "account_in71c4a4ph0vgo2ql3ky",
  description: "Card for Alice"
})
```

Methods that reference an object will take an identifier for that object as
the first argument:

```ruby
card = sam.cards.retrieve("card_ou2s0hwk5rn6kn2e7xg2")
```

When data beyond an identifier is needed for a request, such as with create or
update, pass a Hash with Symbol keys:

```ruby
updated_card = sam.cards.update(
  "card_ou2s0hwk5rn6kn2e7xg2",
  {description: "New description"}
)
```

All methods take request options as their last argument. These can be used to
modify the behaviour of the client for that particular request. This argument
can always be omitted if not needed. See the `Sam::RequestOptions`
docs for details:

```ruby
card = sam.cards.update(
  "card_ou2s0hwk5rn6kn2e7xg2",
  {description: "New description"},
  {max_retries: 1}
)
```

Detailed documentation for all resources can be found in the `Sam::Resources`
namespace.

### Models

The library provides Ruby classes for all responses returned by the API.
Instances of these classes allow convenient access to parsed response data:

```ruby
card = sam.cards.create({
  account_id: "account_in71c4a4ph0vgo2ql3ky",
  description: "Card for Bob"
})
card.expiration_year
#=> 2028
```

You can also access model attribute data using key lookup syntax:

```ruby
card[:expiration_year]
#=> 2028
```

To get all parsed data as a Hash, use `to_h`:

```ruby
card_data = card.to_h
card_data.keys
#=> [:id, :account_id, :created_at, :description, ...]
```

See the `Sam::Models` docs for details.

### Errors

When the library is unable to connect to the API, or if the API returns a
non-success status code (i.e., 4xx or 5xx response), a subclass of
`Sam::HTTP::Error` will be thrown:

```ruby
begin
  agent = sam.agents.retrieve("abc123")
rescue Sam::HTTP::Error => e
  puts e.code # 400
end
```

Error codes are as followed:

| Status Code | Error Type                 |
| ----------- | -------------------------- |
| 400         | `BadRequestError`          |
| 401         | `AuthenticationError`      |
| 403         | `PermissionDeniedError`    |
| 404         | `NotFoundError`            |
| 409         | `ConflictError`            |
| 422         | `UnprocessableEntityError` |
| 429         | `RateLimitError`           |
| >=500       | `InternalServerError`      |
| (else)      | `APIStatusError`           |
| N/A         | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short
exponential backoff. Connection errors (for example, due to a network
connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit,
and >=500 Internal errors will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
sam = Sam::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
sam.agents.retrieve("abc123", max_retries: 5)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the
library is in initial development and has a major version of `0`, APIs may change
at any time.

## Requirements

Ruby 3.0 or higher.
