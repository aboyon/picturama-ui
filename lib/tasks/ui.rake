require 'picturama'

namespace :picturama do

  namespace :ui do
    desc "generate the album based on the path 'base_folder'"
    task :generate do
      path = Picturama::config['base_folder']
      Dir["#{path}/**"].each { |album|
        Rake.application['resized:generate'].reenable
        Rake.application['thumbnail:generate'].reenable
        if File.directory?(album)
          puts "Album for folder #{album.inspect}"
          puts "Title:"
          title = STDIN.gets.chomp
          unless title.nil?
            puts "Description (optional):"
            description = STDIN.gets.chomp
            puts "Author (optional):"
            author = STDIN.gets.chomp
            Rake::Task['resized:generate'].invoke(album)
            Rake::Task['thumbnail:generate'].invoke(album)
            info = {"album" => {"title" => title, "description" => description, "author" => author}}
            File.open("#{album}/.info.yml", 'w+') {|f| f.write(info.to_yaml) }
          else
            puts "Title cannot be empty. Run the task again"
          end
        else
          puts "Sorry but #{path.inspect} entered is not a folder. Run the task again"
        end
      }
    end
  end

end