require 'test_helper'

class ImagegalMailerTest < ActionMailer::TestCase
  test "new_imagegal" do
    mail = ImagegalMailer.new_imagegal
    assert_equal "New imagegal", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
  test "destroy_imagegal" do
    mail = ImagegalMailer.destroy_imagegal
    assert_equal "Destroy imagegal", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
  test "update_imagegal" do
    mail = ImagegalMailer.update_imagegal
    assert_equal "Update imagegal", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
