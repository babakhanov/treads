class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    render html: "", layout: true
  end
  def index2
    client = Savon.client(wsdl: 'http://www.webservicex.net/country.asmx?WSDL')    
    response = client.call(:get_countries)
    parser = Nori.new
    @response = parser.parse(response.body[:get_countries_response][:get_countries_result])["NewDataSet"]["Table"]
  end
end
