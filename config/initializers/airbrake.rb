Airbrake.configure do |config|
  config.api_key = '01e510d83b40aece7fe6f34384ea8ae4'
  config.host    = 'localhost'
  config.port    = 3000
  #config.secure  = config.port == 443
  config.development_environments = []
end