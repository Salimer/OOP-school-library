require 'json'

module Storage
  def storage_directory_check?
    Dir.exist?('storage')
  end

  def create_storage_directory
    Dir.mkdir('storage')
  end

  def file_check?(name)
    File.exist?("#{name}.json")
  end

  def create_file(name, data)
    File.write("storage/#{name}.json", JSON.pretty_generate(data))
  end
end
