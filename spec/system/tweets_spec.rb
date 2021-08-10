require 'rails_helper'

RSpec.describe "Tweet新規登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet = FactoryBot.create(:tweet)
  end
  context "tweetの新規登録ができるとき" do
    it "正しい情報を入力すれば新規tweetの作成成功し、タイムラインのページに遷移" do
      # ログインする
      sign_in(@user)
      # tweet投稿フォームに文字を入力する
      fill_in "tweet_tweet", with: @tweet.tweet
      # つぶやくというボタンをおす
      expect{
        find('input[name="commit"]').click
      }.to change { Tweet.count }.by(1)
      #　投稿が完了しました。というページに遷移する
      expect(page).to have_content "投稿が完了しました。"
      # 投稿一覧へ戻るというボタンをクリックする
        click_link '投稿一覧へ戻る'
      #　タイムラインに遷移する
      expect(current_path).to eq tweets_path
    end
  end
  context "tweetの新規登録ができないとき" do
    it "謝った情報ではTweetの新規作成ができずに新規投稿ページに遷移する" do
      # ログインする
      sign_in(@user)
      # ログインすると、タイムラインの画面に遷移する
      expect(current_path).to eq tweets_path
      # ツイートの文字数を0にする
      fill_in "tweet_tweet", with: ""
      # 呟くというボタンをおす
      find('input[name="commit"]').click
      # 新規投稿ページにrenderされる
      expect(current_path).to eq tweets_path
      # エラーメッセージが記載されている
      expect(page).to have_content "つぶやきの内容は必須です。140文字以内で投稿してください。"
    end 
    it "サインインしていなければ、新規投稿ページへアクセスできず、root_pathに遷移する" do
      # 新規tweetページに遷移する
      visit new_tweet_path
      #　タイムラインに戻る
      expect(current_path).to eq root_path
    end 
  end
end
