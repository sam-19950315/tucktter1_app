require 'rails_helper'

RSpec.describe Tweet, type: :model do

  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe "ツイートの保存" do
    context "ツイートが投稿できる場合" do
      it "テキストがあれば投稿できる" do
      end
    end

    context "ツイートが投稿できない場合" do
      it "ツイートが空では登録できない" do
        @tweet.tweet = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Tweet can't be blank")
      end
      it "ユーザーが紐づいていなければツイートできない" do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("User must exist")
      end
    end
  end
end