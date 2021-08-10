require 'rails_helper'

RSpec.describe Tweet, type: :model do

  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe "ツイートの保存" do
    context "ツイートが投稿できる場合" do
      it "テキストが1文字であれば投稿できる" do
        @tweet.tweet = "a"
        expect(@tweet).to be_valid
      end
      it "テキストが140文字であれば投稿できる" do
        @tweet.tweet = "ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ"
        expect(@tweet).to be_valid
      end
      it "テキストが1文字~140文字であれば投稿できる" do
        expect(@tweet).to be_valid
      end
    end

    context "ツイートが投稿できない場合" do
      it "ツイートが空では登録できない" do
        @tweet.tweet = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Tweet can't be blank")
      end
      it "ツイートが141文字以上では登録できない" do
        @tweet.tweet = "あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ"
        @tweet.valid?
        binding.pry
        expect(@tweet.errors.full_messages).to include("Tweet is too long (maximum is 140 characters)")
      end
      it "ユーザーが紐づいていなければツイートできない" do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("User must exist")
      end
    end
  end
end