get '/' do
@urls = Url.all
  erb :"static/index"
end

post '/form' do
	@url = Url.new(long_url: params[:long_url], shortened_url: Url.shorten)
	@url.valid?
	@error = @url.errors.full_messages
	@url.save
	
	@urls= Url.all
	erb :"static/index"
end

get '/:shortened_url' do

	@url = Url.find_by(shortened_url: params[:shortened_url])
	
	@url.click_count += 1 
	@url.save
	if @url.long_url.match(/http[s]?/) == nil
		redirect "http://" + "#{@url.long_url}"

	else

		redirect "#{@url.long_url}"
	end

	


end
