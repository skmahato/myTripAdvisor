Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]
  provider :twitter, "LZ2Vo7LxlKZqg4ITxLLVmw2Al", "26mDD4ZhpEB1dXyVuJK62vNMgsWg5YaKkBjFkUG45q9HEneUTD"
end
