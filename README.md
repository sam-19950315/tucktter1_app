# Tucktter(URL:http://3.112.138.45:3000/)
小学生を中心とした、好奇心(こうきしん)を育む学びのサービス
## test-user-account
### 生徒のアカウント
ID:teststudentuser@gmail.com
Pass:123456
### 講師のアカウント
ID:testcoachuser@gmail.com
Pass:123456

<img width="1440" alt="tucktter_LP" src="https://user-images.githubusercontent.com/77444865/129043449-82b37b81-e09c-48d6-93f8-59886b825ea5.png">

# 本アプリ作成への想い
## 目的
受動的な学びから主体的な学びに変えるサービス
## ターゲット
小学生中学年~高学年
## ターゲットの抱える課題
夏休みの自由研究などで、テーマは決まったが、どのように研究を進めていけばよく分からない。
大学生などの講師にアドバイスをもらうことで、研究の道筋を見つけ、昨年とは違った完成度の高い自由研究に仕上げたい！
# 開発環境
* 使用言語:ruby (version:2.6.5)
* フレームワーク:Ruby on Rails(version:6.0.4)
* インフラ:AWS(EC2,S3,RDS),Capistrano
* アプリケーションサーバー:unicorn
* DB:MariaDB(version:5.5.68)
* OS:AmazonLinux2
* プロジェクト管理:git
* テスト:Rspec
* エディタ:VSCode

# Local環境構築手順
①エディタ:VSCodeのインストール
②ソフトウェアダウンロード機能:Command Line Toolsのインストール
③ソフトウェア管理ツール:Homebrewのインストール
④ruby (version:2.6.5)のダウンロード
⑤MySQL(version:5.6.51),Sequel Proのインストール
⑥shared-mime-infoのインストール
⑦gem管理機能:bundler(version:2.1.4)のインストール
⑧rails(version:6.0.4)のインストール
⑨Node.js(version:14.15.3)のインストール
⑩yarn(version:1.22.10)のインストール

# DB設計
<img width="471" alt="スクリーンショット 2021-08-11 23 57 02" src="https://user-images.githubusercontent.com/77444865/129052910-f964c756-f3f0-4735-986d-aafbaa5be007.png">

