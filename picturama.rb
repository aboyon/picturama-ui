$:.push File.expand_path("../lib", __FILE__)

require 'sinatra'
require 'initializer'

Dir["ext/*.rb"].each do |extension|
  require extension
end

set :haml, :format => :html5

before do
  lang_found = request.path_info.scan(/[a-z]{2}/).first
  @locale = (R18n.available_locales.map(&:code).include?(lang_found)) ? lang_found : R18n::I18n.default
  @album_source = Picturama::config['base_folder']
end

get '/' do
  redirect "/#{@locale}"
end

get '/:locale' do
  haml :index, :locals => {
    :albums => Picturama::albums(@album_source)
  }
end

get '/:locale/:album' do
  album_name = "#{@album_source}/#{params[:album]}"
  haml :view_album, :locals => { 
    :album => Picturama::Album.new(:folder => album_name)
  }
end

get '/:locale/:album/:picture' do
  album_name = "#{@album_source}/#{params[:album]}"
  picture = "#{album_name}/#{params[:picture]}"
  haml :picture_view, :locals => { 
    :album    => Picturama::Album.new(:folder => album_name),
    :picture  => Picturama::Picture.new(picture)
  }
end

get '/:locale/:album/:size/:picture' do
  picture = Picturama::Picture.new("#{@album_source}/#{params[:album]}/#{params[:picture]}")
  source_img = picture.thumbnail if params[:size] == 'thumbnail'
  source_img = picture.resized if params[:size] == 'resized'
  source_img = picture.path if params[:size].nil?
  send_file "#{source_img}", :type => "image/#{picture.type.downcase}", :disposition => 'inline'
end

not_found do
  haml :not_found
end