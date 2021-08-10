require 'rails_helper'

describe TweetsController, type: :request do

  before do 
    @tweet = FactoryBot.create(:tweet)
    @user = FactoryBot.create(:user)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get tweets_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する" do 
      get tweets_path
      expect(response.body).to include @tweet.tweet
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get tweet_path(@tweet)
      expect(response.status).to eq 200
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する" do 
      get tweet_path(@tweet)
      expect(response.body).to include @tweet.tweet
    end
    it "showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する" do 
      get tweet_path(@tweet)
      expect(response.body).to include "【コメント一覧】"
    end
    it "showアクションにリクエストするとレスポンスにトータルいいね数表示部分が存在する" do 
      get tweet_path(@tweet)
      expect(response.body).to include "【トータルいいね数】"
    end
    it "showアクションにリクエストするとレスポンスにいいねしたユーザーの一覧表示部分が存在する" do
      get tweet_path(@tweet)
      expect(response.body).to include "いいねしたユーザの一覧"
    end
    it "showアクションにリクエストするとコメント機能に遷移するボタンが存在する" do 
      get tweet_path(@tweet)
      expect(response.body).to include "comment.png"
    end
    it "showアクションにリクエストするとレスポンスにいいねボタンが表示される" do 
      get tweet_path(@tweet)
      expect(response.body).to include "heart.png"
    end
    it "showアクションにリクエストするとレスポンスに戻るボタンが存在する" do 
      get tweet_path(@tweet)
      expect(response.body).to include "戻る"
    end
    it "showアクションにリクエストするとサインインしなければコメントや、いいねはできないというアラートが出てくる" do 
      get tweet_path(@tweet)
      expect(response.body).to include "※※※　「いいね」やコメントの投稿には新規登録/ログインが必要です　※※※"
    end
  end
end