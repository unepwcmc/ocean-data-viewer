# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :get_stats

  layout 'client'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  private

  def get_stats
    @dataset_count = Dataset.count
    @site_links = SiteLink.all
    @site_links.replace @site_links.sort_by {rand}
  end
end
