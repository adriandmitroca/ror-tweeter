require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @tweet = @user.tweets.build(body: "Lorem ipsum")
  end

  test "should be valid" do
    assert @tweet.valid?
  end

  test "user id should be present" do
    @tweet.user_id = nil
    assert_not @tweet.valid?
  end

  test "content should be present" do
    @tweet.body = "   "
    assert_not @tweet.valid?
  end

  test "content should be at most 140 characters" do
    @tweet.body = "a" * 141
    assert_not @tweet.valid?
  end
end
