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

  query = params[:query].gsub(/_/, "%20")
  pages = params[:pages].to_i
  results = []

  iterator = 1
  pages.times do

    doc = Nokogiri::HTML(open("http://www.amazon.com/s/field-keywords=#{query}?page=#{iterator}"))
    
    doc.css('div.product').each do |el|

      title = el.css('a.title').first.content
      
      # there can be no author, a linked author, or an unlinked author
      # there can also be multiple authors, but not dealing with this yet
      if el.css('.ptBrand').empty?
        author = "none"
      else
        if el.css('.ptBrand a').empty?
          author = el.css('.ptBrand').first.content.gsub!(/by /, '')
        else
          author = el.css('.ptBrand a').first.content
        end
      end
      
      image = el.css('.productImage').attribute('src').to_s.gsub(/\._(.*)\.jpg/, '.jpg')
      link = el.css('a.title').attribute 'href'

      results << { :title => title, :author => author, :img => image, :link => link }

    end
    iterator+=1
   end

  results.to_json

end