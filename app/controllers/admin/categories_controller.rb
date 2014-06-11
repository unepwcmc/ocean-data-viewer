class Admin::CategoriesController < Admin::AdminController
  # GET /categories
  def index
    @decision = Decision.find params[:decision_id]
    @categories = @decision.categories
  end

  # GET /categories/1
  def show
    @category = Category.find(params[:id])
  end

  # GET /decisions/new
  # GET /decisions/new.xml
  def new
    @decision = Decision.find params[:decision_id]
    @category = Category.new :decision => @decision

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @decision }
    end
  end

  # GET /decisions/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        format.html { redirect_to([:admin,@category.decision, @category]) }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(category_params)
        flash[:notice] = 'Category was successfully updated.'
        format.html { redirect_to([:admin,@category]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @decision = @category.decision
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(admin_decision_categories_url @decision) }
      format.xml  { head :ok }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :identifier, :short_desc, :description, :decision_id)
  end
end
