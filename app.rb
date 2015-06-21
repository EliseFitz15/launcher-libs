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
  @stories = Story.all
  # @stories = @stories_escaped.content.gsub("\\", "")

  # example = Story.create(name: "example", content: "This is a NOUN and a VERB.")
  # hash = {"NOUN" => "#{noun}", "VERB" => "#{verb}"}
  #
  # string = example.content
  #
  # noun = "runner"
  # verb = "run"
  #
  # hash.each do |key, value|
  #   string.gsub!(key, value)
  # end
  #
  # string
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
  launcher_theme_song = Catalog.create(name: "Launchers Theme Song", content: content).to_json

end

get '/catalog' do

  erb :catalog
end
