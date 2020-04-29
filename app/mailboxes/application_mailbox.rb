class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing /@gmail.com\Z/i => :inbox
end
