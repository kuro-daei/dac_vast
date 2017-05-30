# DAC 新卒研修 VAST Server を作ろう
研修最後のお題です。VASTサーバを作ってください。

## VASTとは

## AD Serverとは

## DATABSE_URL
`config/database.yml`はコミットの対象外です。
自分で`config/database.yml`を作る、もしくは 環境変数`DATABASE_URL`を設定しましょう。
herokuにdeployする時は、事前に次のように設定を行っておいてください。

```
heroku config --app {アプリケーション} | grep DATABASE_URL
# CLEARDB_DATABASE_URL:     mysql://b060ea41769e...
# このURLの mysql を mysql2 に変えて次のように設定する
heroku config:set DATABASE_URL='mysql2://b060ea41769e...' --app {アプリケーション}
```