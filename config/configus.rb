Configus.build Rails.env do
  env :production do
    faye_url ENV['FAYE_URL']

    f do
      key "86cb95ae92394e61ecd88456d4e93ca5"
      secret "b4a6534109445770"
    end
  end

  env :development, parent: :production do
  end

  env :test, parent: :production do
    faye_url nil
  end
end
