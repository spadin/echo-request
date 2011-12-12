require 'bundler'
require 'pp'
Bundler.require

class Echo < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :public_folder, File.join(root, 'public')
  
  before do
    @dump = PP.pp(request, '')
  end
  
  def self.match_all(path, opts={}, &block)
    get(path, opts, &block)
    post(path, opts, &block)
    put(path, opts, &block)
    delete(path, opts, &block)
  end
  
  self::match_all '/' do
    erb :index, :locals => { :dump => @dump }, :content_type => 'text/plain'
  end
end