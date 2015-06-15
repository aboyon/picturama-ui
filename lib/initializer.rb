require 'haml'
require 'sinatra/r18n'
require 'picturama'
require 'pry'

# setting the language depending on the user agent language
R18n::I18n.default do |default|
  if R18n.available_locales.map(&:code).include?(request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first)
    default = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/[a-z]{2}/).first
  end
  default|= 'es'
end