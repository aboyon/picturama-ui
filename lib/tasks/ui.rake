require 'picturama'

namespace :picturama do

  namespace :ui do
    desc "generate the album based on the path 'base_folder'"
    task :generate do
      path = Picturama::config['base_folder']
      if File.directory?(path)
        puts "Title:"
        title = STDIN.gets.chomp
        unless title.nil?
          puts "Description (optional):"
          description = STDIN.gets.chomp
          puts "Author (optional):"
          author = STDIN.gets.chomp
          info = {"album" => {"title" => title, "description" => description, "author" => author}}
          File.open("#{path}/.info.yml", 'w+') {|f| f.write(info.to_yaml) }
          Rake::Task['resized:generate'].invoke(path)
          Rake::Task['thumbnail:generate'].invoke(path)
        else
          puts "Title cannot be empty. Run the task again"  
        end
      else
        puts "Sorry but #{path.inspect} entered is not a folder. Run the task again"
      end
    end
  end

end