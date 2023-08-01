require 'json'

module Storage
    def storage_directory_check?
        Dir.exist?("storage")
    end

    def create_storage_directory
        Dir.mkdir("storage")
    end

    def file_check?(name)
        File.exists?("#{name}.json")
    end

    def create_file(name, data)
        File.open("storage/#{name}.json", "w") do |f|
          f.write(JSON.pretty_generate(data))
        end
    end
end