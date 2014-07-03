class Admin::DataCategoriesController < Admin::AdminController
  def index
    @data_categories = DataCategory.all
  end

  def show
    @data_category = DataCategory.find(params[:id])
  end

  def new
    @data_category = DataCategory.new
  end

  # GET /data_categorys/1/edit
  def edit
    @data_category = DataCategory.find(params[:id])
  end

  def create
    @data_category = DataCategory.new(data_category_params)

    if @data_category.save
      flash[:notice] = 'Data category was successfully created.'
      redirect_to([:admin, @data_category])
    else
      render :action => "new"
    end
  end

  def update
    @data_category = DataCategory.find(params[:id])

    if @data_category.update_attributes(data_category_params)
      flash[:notice] = 'Data category was successfully updated.'
      redirect_to([:admin, @data_category])
    else
        render :action => "edit"
    end
  end

  def destroy
    @data_category = DataCategory.find(params[:id])
    @data_category.destroy

    redirect_to(admin_data_categories_url)
  end

  private

  def data_category_params
    params.require(:data_category).permit(:name, :description)
  end
end
