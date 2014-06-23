class ApplicationController < ActionController::Base
  include InjectableServices

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :get_stats

  layout 'client'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def default_serializer_options
    {
      root: false
    }
  end

  private

  def get_stats
    @dataset_count = Dataset.count
    @site_links = SiteLink.all
    @site_links.replace @site_links.sort_by {rand}
  end
end
