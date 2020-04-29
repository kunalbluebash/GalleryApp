require 'test_helper'

class ImagegalMailerTest < ActionMailer::TestCase
  test "new_imagegal" do
    mail = ImagegalMailer.new_imagegal
    assert_equal "New imagegal", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
