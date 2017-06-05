# レポート関連コントローラ
class ResultsController < ApplicationController
  # 結果一覧表示
  def index
    # TODO
  end

  # 結果追加
  def record
    # TODO
    send_data(Base64.decode64('R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=='),
      type: 'image/gif', disposition: 'inline')
  end
end
