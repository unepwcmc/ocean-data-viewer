class ProxyController < ApplicationController

  def geo_proxy
    url = params[:url]
    @proxy_page = ''
    if /http:\/\/ec2-184-73-120-49\.compute-1\.amazonaws\.com\:8080\/geoserver\/wms(.*)/.match url
      uri = URI.parse url
      @proxy_page = Net::HTTP.get(uri)
    end
    render :layout => false
  end
end
