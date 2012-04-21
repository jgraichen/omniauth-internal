require "omniauth"
require "omniauth/multipassword/base"

module OmniAuth
  module Strategies
    class Internal
      include OmniAuth::Strategy
      include OmniAuth::MultiPassword::Base

      info do
        { username: username }
      end

      def model
        options[:model] || ::User
      end

      def authenticate(username, password)
        model.authenticate(username, password)
      end
    end
  end
end
