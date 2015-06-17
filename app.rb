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

get "/.json" do

  content = '''
  Now this is a story all about how my #{params[:noun]} got flipped #{params[:verb]} upside down. And I\'d like to take a #{params[:time]} just sit right down and I\'ll tell you how I became the #{params[:occupation]} of a place called Chinatown. In west  #{params[:hometown]} delphia born and raised, on the  #{params[:place]} was where I spent most of my days. Chillin out maxin relaxin all cool, and all #{params[:hobby]} outside of the school, when a couple of #{params[:animal]} who were up to no good, started making trouble in my neighborhood I got in one game of #{params[:boardgame]} and my mama frowned, she said: you are movin with 40 #{params[:adjective]} people in Chinatown. I #{params[:verb_two]} for a cab and when it came near, the license plate said #{params[:adjective_two]} and it had dice in the mirror. If anything I could say #{params[:noun_two]} had soul, but I thought: Nah, forget it - Yo, home to Mission Control. I pulled up to 33 Harrison about 7 or 8. And I yelled to the cabbie Yo home #{params[:verb_three]} ya later! I looked at my kingdom I was finally there to code on my throne  as the #{params[:occupation]} of Chinatown.
  '''
  launcher_theme_song = Story.create(name: "Launchers Theme Song", content: content).to_json

  stories = Story.all

  json({
    # stories: stories
    "Hello" => "World"
    })

end

post '/' do


end
