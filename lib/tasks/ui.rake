require 'picturama'
require 'pry'
require 'colorize'

namespace :picturama do
  namespace :ui do
    desc "generate the album based on the path 'album_source'"
    task :generate do
      path = Picturama::config['album_source']
      Dir["#{path}/**"].each do |album|
        Rake.application['picturama:resized:generate'].reenable
        Rake.application['picturama:thumbnail:generate'].reenable
        if File.directory?(album)

          # let's chek if it is already an album
          album_data = Picturama::Album.new(:folder => album)
          if album_data.valid?
            puts "#{album} is already an album".white.on_red
            next
          end

          puts "Album for folder #{album.inspect}".white.on_blue
          puts "Title:"
          title = STDIN.gets.chomp
          unless title.nil?
            puts "Description (optional):"
            description = STDIN.gets.chomp
            puts "Author (optional):"
            author = STDIN.gets.chomp
            Rake::Task['picturama:resized:generate'].invoke(album)
            Rake::Task['picturama:thumbnail:generate'].invoke(album)
            info = {"album" => {"title" => title, "description" => description, "author" => author}}
            File.open("#{album}/.info.yml", 'w+') {|f| f.write(info.to_yaml) }
          else
            puts "Title cannot be empty. Run the task again".red
          end
        else
          puts "Sorry but #{path.inspect} entered is not a folder. Run the task again".white.on_red
        end
      end
    end
  end

end