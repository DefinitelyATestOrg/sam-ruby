# Sam Ruby API library

The Sam Ruby library provides convenient access to the Sam REST API from any Ruby 3.0+
application.

It is generated with [Stainless](https://www.stainlessapi.com/).

## Documentation

Documentation for the most recent version of this gem can be found [on RubyDoc](https://rubydoc.info/github/DefinitelyATestOrg/sam-ruby).

The underlying REST API documentation can be found on [docs.sam.com](https://docs.sam.com).

## Installation

To use this gem during the beta, install directly from GitHub with Bundler by
adding the following to your application's `Gemfile`:

```ruby
gem "sam-ruby", git: "https://github.com/DefinitelyATestOrg/sam-ruby", branch: "main"
```

To fetch an initial copy of the gem:

```sh
bundle install
```

To update the version used by your application when updates are pushed to
GitHub:

```sh
bundle update sam-ruby
```

## Usage

```ruby
require "sam-ruby"

sam = SamRuby::Client.new

order = sam.stores.create_order

puts(order.id)
```

### Errors

When the library is unable to connect to the API, or if the API returns a
non-success status code (i.e., 4xx or 5xx response), a subclass of
`SamRuby::HTTP::Error` will be thrown:

```ruby
begin
  store = sam.stores.create_order
rescue SamRuby::HTTP::Error => e
  puts(e.code) # 400
end
```

Error codes are as followed:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >=500       | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short
exponential backoff. Connection errors (for example, due to a network
connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors,
and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
sam = SamRuby::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
sam.stores.create_order(max_retries: 5)
```

### Timeouts

By default, requests will time out after 60 seconds.
Timeouts are applied separately to the initial connection and the overall request time,
so in some cases a request could wait 2\*timeout seconds before it fails.

You can use the `timeout` option to configure or disable this:

```ruby
# Configure the default for all requests:
sam = SamRuby::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
sam.stores.create_order(timeout: 5)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the
library is in initial development and has a major version of `0`, APIs may change
at any time.

## Requirements

Ruby 3.0 or higher.
