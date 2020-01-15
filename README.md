# Rails 5, React, Reactstrap, CRUD example

see blog post: https://ericlondon.com/2019/01/13/rails-5-api-react-bootstrap-crud-example.html

## Change by katoy.

## See

- <https://ericlondon.com/2019/01/13/rails-5-api-react-bootstrap-crud-example.html>
  Rails 5 API, React, Bootstrap, CRUD example

## changed

- ruby version:  2.5.3 -> 2.6.5

- rails version: 5.2.2 -> 6.0.2.1

- api/posts_controller.rb -> api/v1/posts_controller.rb

## TODO

- 日本語対応

- doker (web, db)

- openapi の導入

- Locust の導入

- CircleCI と github 上のページにバッジの配置

- forntend の テスト (coverage, screnncast, scrennshot)


## DB の初期化と、アプリの起動

```bash
$ cd api
$ bundle install
$ bundle exec rails db:delete
$ bundle exec rails db:create
$ bundle exec rails db:migrate
$ bundle exec rails db:seed
$ rails s -p 3000 -b 0.0.0.0

$ cd ../frontend
$ yarn install
$ yarn start
  
$ open http://localhost:3000
```

## metrics 

```
$ cd api
$ bundle exec rake metrics:all
$ open tmp/metric_fu/output/index.html
```

## documentation (blueprint)

```
$ npm install -g aglio
$ bundle exec rails docs:generate

then
  $ aglio -i doc/api/index.apib -o doc/api/index.html
  ($ aglio -i doc/api/index.apib -o doc/api/index.html --theme-template triple --theme-variables flatly)
  $ open doc/api/index.html
or
  $ aglio -i doc/api/index.apib -s
  then access http://localhost:3000
```

rails docs:generate 時に unexpected token at '[binary data]'
のようなエラーがでたら、
gems/rspec_api_documentation-6.1.0/lib/rspec_api_documentation/client_base.rb
中にある [binary data] をせっていている部分を無恋にしてやる事。

aglio 実行時に次のようなエラーがでたら、cache  ファイルを mkdir してやること。

```
Error: Could not get CSS: Error writing cached CSS to file: ENOENT: no such file or directory, open '/usr/local/lib/node_modules/aglio/node_modules/aglio-theme-olio/cache/bb851236ef33e467631256487d5bbe519de24415.css'
```

## documentation (apinapi)

TODO

## documentation (ER図)

DB 構造のドキュメントは以下のようにして生成し、閲覧ができる。

```bash
$ cd schemaspy
$ ./run.sh
$ open output/index.html
```


## brakeman

```bash
$ brakeman
```

## test an coverage

```bash
$ rails spec
$ (bundle exec rspec)
$ open coverage/index.html
$ open screenshots/*.png
```

テストの実行 (chrome headless で起動して system テストも行っている)
system テストで失敗すると、画面のスクリーンショットが ./tmp 以下に保存される。
いくつかのテストでは、成功した場合は、./scrennshots 以下に保存されるようにしてある。

```bash
$ brew cask install chromedriver
$ bundle exec rails spec
$ open coverage/index.html
$ open z/*.png
```


## See also

- <https://qiita.com/kaishuu0123/items/00b89e092f156a02a3e5>
  Rails 5.1 API mode + webpacker + react + reactstrap で ToDO アプリを書く

- <https://github.com/kaishuu0123/rails5.1-react-reactstrap-example>
  Rails 5.1 + webpacker + react + reactstrap Example

- <https://tackeyy.com/blog/posts/token-base-api-with-rails-and-devise-token-auth>
  [Rails5] devise_token_auth でAPIを作成する / 新規登録・ログイン

- <https://www.storyblok.com/tp/rspec-api-documentation>
  How we use RSpec to automatically generate API documentations

- <https://github.com/everydayrails/everydayrails-rspec-2017>
  Everyday Rails Testing with RSpec sample application (2017 edition)

- <https://techracho.bpsinc.jp/hachi8833/2018_01_25/51101>
  Rails 5.1以降のシステムテストをRSpecで実行する（翻訳）

- <https://qiita.com/g-fujioka/items/091c400814800f1280ff>
  Capybara+headless-chrome でフルサイズのスクリーンショットを撮る

- <https://softwarebrothers.co/blog/apiary-documentation-rspec-api-doc-generator/>
  APIARY DOCUMENTATION WITH RSPEC API DOC GENERATOR

- <https://qiita.com/kai_kou/items/630f6c1e4e577518bd14>
  api blueprintとaglioを利用してAPI仕様書を作成する

- <https://www.npmjs.com/package/aglio-theme-api>
  Aglio Default Theme

- <https://kakakakakku.hatenablog.com/entry/2018/08/08/200903>
  GitHub の README.md をバッジでオシャレにできる Shields.io と dockeri.co

- <https://circleci.com/docs/2.0/code-coverage/#ruby>
  Viewing Coverage on CircleCI

- <https://docs.codeclimate.com/docs/circle-ci-test-coverage-example#section-circleci-20-parallel-builds>
  CircleCI Test Coverage




























- <https://tackeyy.com/blog/posts/token-base-api-with-rails-and-devise-token-auth>
  [Rails5] devise_token_auth でAPIを作成する / 新規登録・ログイン

- <https://www.storyblok.com/tp/rspec-api-documentation>
  How we use RSpec to automatically generate API documentations

- <https://github.com/everydayrails/everydayrails-rspec-2017>
  Everyday Rails Testing with RSpec sample application (2017 edition)

- <https://techracho.bpsinc.jp/hachi8833/2018_01_25/51101>
  Rails 5.1以降のシステムテストをRSpecで実行する（翻訳）

- <https://qiita.com/g-fujioka/items/091c400814800f1280ff>
  Capybara+headless-chrome でフルサイズのスクリーンショットを撮る

- <https://softwarebrothers.co/blog/apiary-documentation-rspec-api-doc-generator/>
  APIARY DOCUMENTATION WITH RSPEC API DOC GENERATOR

- <https://qiita.com/kai_kou/items/630f6c1e4e577518bd14>
  api blueprintとaglioを利用してAPI仕様書を作成する

- <https://www.npmjs.com/package/aglio-theme-api>
  Aglio Default Theme

- <https://kakakakakku.hatenablog.com/entry/2018/08/08/200903>
  GitHub の README.md をバッジでオシャレにできる Shields.io と dockeri.co

- <https://circleci.com/docs/2.0/code-coverage/#ruby>
  Viewing Coverage on CircleCI

- <https://docs.codeclimate.com/docs/circle-ci-test-coverage-example#section-circleci-20-parallel-builds>
  CircleCI Test Coverage

