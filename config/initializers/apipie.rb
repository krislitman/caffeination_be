Apipie.configure do |config|
  config.app_name                = "CaffeinationBe"
  config.api_base_url            = "/api/v1"
  config.doc_base_url            = "/apipie"
  config.validate                = false
  
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/v1/*.rb"
  config.default_version = "1.0"
end
