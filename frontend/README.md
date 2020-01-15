
# 概要

## Start

```
$ yarn install
$ yarn start
```

## Test

```
$ yarn test -- --coverage
$ open coverage/lcov-report/index.html 
```

## See

- <https://qiita.com/kobanyan/items/11c67118051c152fdb69>
  Cypress で html テストレポート (mochawesome) を出力する
  テスト結果をスクリーンショットおよび動画付きで公開することができます。

```
$ rm -rf mochawesome-report cypress/report
$ yarn cypress run
$ mkdir cypress/report
$ yarn --silent mochawesome-merge > cypress/report/mochawesome.json
$ yarn marge cypress/report/mochawesome.json -o cypress/report
```
