class Admin::SiteLinksController < Admin::AdminController
  # GET /site_links
  # GET /site_links.xml
  def index
    @site_links = SiteLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @site_links }
    end
  end

  # GET /site_links/1
  # GET /site_links/1.xml
  def show
    @site_link = SiteLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site_link }
    end
  end

  # GET /site_links/new
  # GET /site_links/new.xml
  def new
    @site_link = SiteLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site_link }
    end
  end

  # GET /site_links/1/edit
  def edit
    @site_link = SiteLink.find(params[:id])
  end

  # POST /site_links
  # POST /site_links.xml
  def create
    @site_link = SiteLink.new(site_link_params)

    respond_to do |format|
      if @site_link.save
        flash[:notice] = 'SiteLink was successfully created.'
        format.html { redirect_to(admin_site_link_path @site_link) }
        format.xml  { render :xml => @site_link, :status => :created, :location => @site_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @site_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /site_links/1
  # PUT /site_links/1.xml
  def update
    @site_link = SiteLink.find(params[:id])

    respond_to do |format|
      if @site_link.update_attributes(site_link_params)
        flash[:notice] = 'SiteLink was successfully updated.'
        format.html { redirect_to(admin_site_link_path @site_link) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /site_links/1
  # DELETE /site_links/1.xml
  def destroy
    @site_link = SiteLink.find(params[:id])
    @site_link.destroy

    respond_to do |format|
      format.html { redirect_to(admin_site_links_url) }
      format.xml  { head :ok }
    end
  end

  private

  def site_link_params
    params.require(:site_link).permit(:title, :body, :link)
  end
end
