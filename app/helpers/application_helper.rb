module ApplicationHelper
  include ERB::Util
  
  def geocode_address(address)
    uri = URI.parse("http://maps.googleapis.com/maps/api/geocode/json?address=#{u address}&sensor=false")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
          
    response = http.request(request)                 
    if response.code == '200'
      result = JSON.parse(response.body)
      # 'lat', 'lng'
      result['results'][0]['geometry']['location']
    else
      nil
    end
    
  rescue
    puts "Could not convert #{address}"
  end
end
