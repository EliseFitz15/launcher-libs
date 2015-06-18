require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/json'

configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get "/" do

  erb :index
end

get "/stories.json" do
  stories = Story.all

  json({
    stories: stories
    })
end

post '/' do
  noun = params[:noun]
  verb = params[:verb]
  time = params[:time]

  content = "Now this is a story all about how my #{noun} got flipped #{verb} upside down. And I\'d like to take a #{time} just sit right down"
  launcher_theme_song = Story.create(name: "Launchers Theme Song", content: content).to_json

end
