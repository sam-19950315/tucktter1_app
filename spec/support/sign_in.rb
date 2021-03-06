module SignInSupport
  def sign_in(user)
     # ログインページへ遷移する
     visit new_user_session_path
     # ログイン情報を入力する
     fill_in 'user_email', with: user.email
     fill_in 'user_password', with: user.password
     # ログインボタンを押す
     find('input[name="commit"]').click
     # トップページに遷移したことを確認する
     expect(current_path).to eq tweets_path
  end
end