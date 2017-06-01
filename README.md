# DAC 新卒研修 VAST Server を作ろう
研修最後のお題です。VASTサーバを作ってください。

## AD Serverとは
#### 何ができるか
・自社サイトの特定の枠に広告を出せる　（例）トップページのレクタングル枠、記事ページのレクタングル枠  
・期間を設定できる　（例）2017/6/1 00:00:00 〜 2017/6/30 23:59:59  
・ゴールが設定できる　（例）100万imp、100クリック  
・複数の広告を並行して配信しても全部ゴールに到達できるように調整してくれる　（例）今この広告は順調なペースだからペースが遅れているこっちを優先して配信しよう  
　※もちろん、サイトへのアクセスが100しかないのにゴールを1000にしたら到達は無理です。  
・ターゲティングができる　（例）IOSのみ、Androidのみ、Macのみ  

#### どういう仕組みか
アドサーバを使って広告配信するためには、以下のような準備が必要である。  
サイト：アドタグの設置  
アドサーバー：広告設定  
<img src="http://webdemo.dac.co.jp/omi/vast/vast_1.png"></img>

上のような準備ができていれば、実際にユーザーがサイトにアクセスしてきた際に、以下のようなフローで処理され、広告が配信できる。  
<img src="http://webdemo.dac.co.jp/omi/vast/vast_2.png"></img>

アドサーバーで配信できる広告の種類には以下のようなものがある。  
・画像  
・テキスト  
・Flash  
・第三者配信  
・HTML5アニメーション  
・VAST広告(youtubeの最初に流れてるような動画広告)  

## VASTとは
動画広告を配信する上で世界で決められているルール（プロトコル）。  
動画広告の配信には動画プレイヤー、アドサーバの2つを使うが、この両者がVASTに対応する（ルールに則り実装する）ことで、  
プレイヤーとしてはどのアドサーバとも連携でき、  
アドサーバとしてはどのプレイヤーとも連携する事ができる。  
※詳しい説明はこちら：  
「VASTって何？」http://yebisupress.dac.co.jp/2015/03/13/%E3%80%90%E5%8B%95%E7%94%BB%E5%BA%83%E5%91%8A%E3%80%91vast%E3%81%A3%E3%81%A6%E4%BD%95%EF%BC%9F/  
※もっと詳しく知りたい：「実際のIABのVAST仕様」https://www.iab.com/guidelines/digital-video-ad-serving-template-vast-2-0/

#### どういう仕組みか
VAST広告の配信では、以下のような準備が必要である。  
サイト：動画プレイヤーのタグ
     VAST URL(動画プレイヤーの処理中にこのURLを使う）
アドサーバー：広告設定(動画URLを設定)  
<img src="http://webdemo.dac.co.jp/omi/vast/vast_3.png"></img>

上のような準備ができていれば、実際にユーザーがサイトにアクセスしてきた際に、以下のようなフローで処理され、VAST広告が配信できる。  
<img src="http://webdemo.dac.co.jp/omi/vast/vast_4.png"></img>

動画広告は通常の画像やテキスト広告とは指標が異なる。
動画以外：imp,click,CTR
動画：imp,click,CTR、start,1/4,2/4,3/4,complete,mute,unmute,pose,rewind,fullscreen,etc...

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
