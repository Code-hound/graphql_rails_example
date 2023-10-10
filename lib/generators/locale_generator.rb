require 'rails/generators/resource_helpers'

class LocaleGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers

  class_option :language, type: :string, default: Rails.application.config.i18n.default_locale

  def create_translation_files
    template 'model_translation.yml', File.join("config/locales/models/#{file_name}", "#{language}.yml")
  end

  def language
    @language ||= options['language']
  end
end
