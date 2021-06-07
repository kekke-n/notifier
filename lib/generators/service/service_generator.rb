class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_service_file
    template "service.rb", File.join("app/services", class_path, "#{file_name}_service.rb")
  end
end
