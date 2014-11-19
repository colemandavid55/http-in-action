require 'rest_client'
require 'json'





module MakerBlog
  class Client
    def list_posts
      response = RestClient.get('http://makerblog.herokuapp.com/posts', accept: 'application/json')
      posts = JSON.parse(response.body)
      posts.each do |post|
        puts "#{post['name']} just posted #{post['title']}. It says: #{post['content']}"
      end
    end
  end
end

client = MakerBlog::Client.new
client.list_posts