require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Springで必要な設定: クラスのキャッシュを無効化
  config.cache_classes = false

  # Springで必要な設定: リロードを有効化
  config.enable_reloading = true

  # CI環境ではイーガーロードを有効化
  config.eager_load = ENV["CI"].present?

  # パブリックファイルのキャッシュ制御
  config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.hour.to_i}" }

  # ローカル環境でのリクエストの詳細を表示
  config.consider_all_requests_local = true

  # コントローラーのキャッシュ設定
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # 例外を表示する設定
  config.action_dispatch.show_exceptions = :rescuable

  # フォージェリ保護を無効化
  config.action_controller.allow_forgery_protection = false

  # テスト環境用のストレージ設定
  config.active_storage.service = :test

  # メーラーのキャッシュ設定
  config.action_mailer.perform_caching = false

  # テスト環境でのメール送信設定
  config.action_mailer.delivery_method = :test
  config.action_mailer.default_url_options = { host: "www.example.com" }

  # 非推奨の警告を標準エラーに出力
  config.active_support.deprecation = :stderr

  # 非推奨の警告を例外として扱う
  config.active_support.disallowed_deprecation = :raise

  # 無効化された非推奨警告の一覧
  config.active_support.disallowed_deprecation_warnings = []

  # コールバックが見つからない場合の例外を有効化
  config.action_controller.raise_on_missing_callback_actions = true
end
