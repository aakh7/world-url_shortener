get '/' do
@urls = Url.all
  erb :"static/index"
end

post '/form' do
	@url = Url.new(long_url: params[:long_url], shortened_url: Url.shorten)
	@url.save

	redirect '/'
end

get '/:shortened_url' do

	@url = Url.find_by(shortened_url: params[:shortened_url])
	
	redirect "http://" + @url.long_url

end
