class Creds
  def self.get(key, *args)
    credential_value = args.blank? ? Rails.application.credentials[key].to_s : Rails.application.credentials.dig(key, *args).to_s
    ERB.new(credential_value).result
  end
end