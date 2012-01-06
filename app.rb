require 'rubygems'
require 'bundler'
require 'open-uri'
Bundler.require(:default)

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_folder, 'public'
set :haml, {:format => :html5} # default Haml format is :xhtml

get '/' do
  haml :index
end

get '/:query/:pages' do
  content_type = 'json'

  query = params[:query].gsub /_/, "%20"
  pages = params[:pages].to_i
  results = []

  iterator = 1
  pages.times do

    doc = Nokogiri::HTML(open("http://www.amazon.com/s/field-keywords=#{query}?page=#{iterator}"))

    doc.css('div.product').each do |el|
      title = el.css('a.title').first.content
      author = el.css('.ptBrand a').empty? ? el.css('.ptBrand').first.content.gsub!(/by /, '') : el.css('.ptBrand a').first.content
      image = el.css('.productImage').attribute('src').to_s.gsub /\._(.*)\.jpg/, '.jpg'
      link = el.css('a.title').attribute 'href'

      results << { :title => title, :author => author, :img => image, :link => link }

    end
    iterator+=1
   end

  results.to_json

end