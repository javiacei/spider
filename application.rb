require 'sinatra/base'

conf = File.expand_path "../config/environments/#{ENV['RACK_ENV']}.rb", __FILE__
require conf if File.exist?(conf)

# Ironhack module
module Ironhack
  # Ironhack application
  class Application < Sinatra::Base
    get '/:course/:week/:day/:unit' do
      @unit =  "#{params[:unit]}.md"
      path = "week_#{params[:week]}/day_#{params[:day]}/#{@unit}"

      base64_file = Octokit.contents "javiacei/#{params[:course]}", path: path
      base64_content = base64_file.content

      @content = Base64.decode64(base64_content)

      erb :index
    end
  end
end
