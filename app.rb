require 'rubygems'
require 'bundler'

Bundler.require

require "sinatra/assetpack"
require "sinatra/reloader" if development?

class Application < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :sass, { :load_paths => [ "#{self.root}/css" ]}
  
  configure :development do
    register Sinatra::Reloader
  end
  
  register Sinatra::AssetPack

  assets do
    serve '/css', from: 'css'
    css :app, ['/css/*.css']
  end
  
  get '/' do
    'boo'
  end
end
