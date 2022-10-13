FROM ruby:3.1.2

# データベース用にPostgreSQLをインストール
RUN apt-get update -qq && apt-get install -y postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
# bundlerバージョンを上げないとエラーになる対策
RUN gem update --system 3.3.20 && bundle install
COPY . /myapp

# コンテナ起動時に実行させるentrypoint.shを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]