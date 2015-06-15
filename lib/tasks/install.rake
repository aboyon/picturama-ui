require 'picturama'
require 'pry'
require 'colorize'

namespace :picturama do
  desc "Install the picturama bare configuration"
  task :install do
    picturama = Gem::Specification.find_by_name 'picturama'
    yaml_content = File.read("./config/picturama.sample.yml")
    puts "Enter the path where the pictures are".white.on_blue
    puts "Path (e.g /home/david/Pictures):"
    path = STDIN.gets.chomp
    puts "Now, enter the filetype separated by comma".white.on_blue
    puts "File type supported (e.g jpg, png, gif):"
    types = STDIN.gets.chomp
    puts "Which should be the prefix for the thumbnails?".white.on_blue
    puts "Prefix (e.g _thumb):"
    thumbnail_prefix = STDIN.gets.chomp
    puts "Which should be the thumbnails size?".white.on_blue
    puts "Size (e.g 200x200):"
    thumbnail_size = STDIN.gets.chomp
    puts "Which should be the prefix for the resized?".white.on_blue
    puts "Resized (e.g _resized):"
    resized_prefix = STDIN.gets.chomp
    puts "Which should be the resized size?".white.on_blue
    puts "Size (e.g 800x800):"
    resized_size = STDIN.gets.chomp
    File.open("./config/picturama.yml","w+") do |file|
      file.write("#{yaml_content}" % {
        :album_path => path,
        :album_format => types.split(","),
        :album_thumbnail_prefix => thumbnail_prefix,
        :album_thumbnail_size => thumbnail_size,
        :album_resized_prefix => resized_prefix,
        :album_resized_size => resized_size
      })
    end
    puts "Success!".green
    puts "config/picturama.yml was created. Now you should run rake picturama:ui:generate in order to build your albums"
  end
end