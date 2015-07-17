class Admin::DatasetsController < Admin::AdminController
  inject :dataset, :data_categories, :data_formats, :observation_types, :geographical_ranges
  helper_method :data_categories, :data_formats, :observation_types, :geographical_ranges

  before_action :get_existing_tags, only: [:new, :edit]

  # GET /datasets
  # GET /datasets.xml
  def index
    @datasets = Dataset.all.order("order_number ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datasets }
    end
  end

  # GET /datasets/1
  # GET /datasets/1.xml
  def show
    @dataset = dataset
    @linked_decisions = @dataset.datasets_decisions

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dataset }
    end
  end

  # GET /datasets/new
  # GET /datasets/new.xml
  def new
    @dataset = Dataset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dataset }
    end
  end

  # GET /datasets/1/edit
  def edit
    @dataset = dataset
  end

  # POST /datasets
  # POST /datasets.xml
  def create
    @dataset = Dataset.new(dataset_params)

    respond_to do |format|
      if @dataset.save
        flash[:notice] = 'Dataset was successfully created.'
        format.html { redirect_to([:admin,@dataset]) }
        format.xml  { render :xml => @dataset, :status => :created, :location => @dataset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dataset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datasets/1
  # PUT /datasets/1.xml
  def update
    @dataset = dataset

    respond_to do |format|
      if @dataset.update_attributes!(dataset_params)
        flash[:notice] = 'Dataset was successfully updated.'
        format.html { redirect_to([:admin,@dataset]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dataset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datasets/1
  # DELETE /datasets/1.xml
  def destroy
    @dataset = dataset
    @dataset.destroy

    respond_to do |format|
      format.html { redirect_to(admin_datasets_url) }
      format.xml  { head :ok }
    end
  end

  private

  def get_existing_tags
    @tags = Dataset.pluck(:tags).flatten.compact.uniq.sort || []
  end

  def dataset_params
    params.require(:dataset).permit(:title, :short_desc, :long_desc, :tags_array,
      :metadata_description, :shp_download, :wms_server, :wfs, :meta_download,
      :licence_desc, :wms_name, :styles, :view_params, :arcgis_link, :order_number,
      :has_legend, :html, :xml, :factsheet, :creation_date, :time_range_start,
      :time_range_end, :data_provider, :geographical_range, :image, :delete_image,
      :layer_color, :factsheet_url, :version,
      data_category_ids: [], observation_type_ids: [], data_format_ids: [])
  end
end
