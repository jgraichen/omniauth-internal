# Omniauth::Internal

**omniauth-internal** is a [OmniAuth](https://github.com/intridea/omniauth)
strategy to authenticate using Rails 3.1 `has_secure_password`
by delegating to `User.authenticate(username, password)`.

**omniauth-internal** can be used as a authenticator for
[OmniAuth MultiPassword](https://github.com/jgraichen/omniauth-multipassword).

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-internal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-internal

## Usage

Add a `authenticate` class method to your model:

```ruby
  def self.authenticate(login, password)
    find_by_email(login).try(:authenticate, password)
  end
```

You can configure the model class used by **omniauth-internal**.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :internal, :model => ::MyUser
end
```

## Options

** model **
The model to call `authenticate` on.
(default: `User`)

** title **
The title text shown on default login form.
(default: `"Restricted Access"`)

** fields **
The request parameter names to fetch username and password.
(default: `[ "username", "password" ]`)


## License

[MIT License](http://www.opensource.org/licenses/mit-license.php)

Copyright (c) 2012, Jan Graichen
