require 'bundler'
require 'pp'
Bundler.require

class Echo < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :public_folder, File.join(root, 'public')
  
  get '/' do
    dump = PP.pp(request, '')
    erb :index, :locals => { :dump => dump }, :content_type => 'text/plain'
  end
end