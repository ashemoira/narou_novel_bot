require 'typhoeus'
require 'nokogiri'
require 'uri'
require 'yaml'

def zip_message(response)
  zip = '```'
  @doc = Nokogiri::HTML(response.response_body)
  @doc.css('.tl').length.times do |index|
    zip << @doc.css('.tl')[index].inner_text << "\n"
  end
  zip << '検索にヒットしませんでした' if @doc.css('.tl').length.zero?
  zip << '```'
end

def create_url(word, option)
  option_yml = YAML.load_file('../config/option.yml')
  return if option_yml['option'][option].nil?
  option_yml['option'][option].gsub!(/url/, CGI.escape(word))
end

def response(url)
  request = Typhoeus::Request.new(url)
  request.run
end

def option_search(args)
  option = args[0].include?('-') ? args[0] : args[1]
  word = option != args[0] ? args[0] : args[1]
  url = create_url(word, option)
  response = response(url)
  zip_message(response)
end

def search(arg)
  return if arg.nil?
  url = CGI.escape(arg)
  url_yml = YAML.load_file('../config/option.yml')

  response = response(url_yml['normal'] + url)
  zip_message(response)
end
