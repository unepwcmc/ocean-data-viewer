class Admin::DatasetsDecisionsController < Admin::AdminController
  layout 'admin'
  # GET /datasets_decisions
  def index
    @dataset = Dataset.find params[:dataset_id]
    @datasets_decisions = @dataset.datasets_decisions
  end

  # GET /datasets_decisions/1
  def show
    @datasets_decision = DatasetsDecision.find(params[:id])
  end

  # GET /decisions/new
  # GET /decisions/new.xml
  def new
    @dataset = Dataset.find params[:dataset_id]
    @datasets_decision = DatasetsDecision.new :dataset => @dataset
    @decisions = Decision.order("name ASC")
    @categories = []

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @decision }
    end
  end

  # GET /decisions/1/edit
  def edit
    @datasets_decision = DatasetsDecision.find(params[:id])
    @decisions = Decision.all
    @categories = @datasets_decision.try(:decision).try(:categories)
    @categories ||= []
  end

  # POST /datasets_decisions
  # POST /datasets_decisions.xml
  def create
    @datasets_decision = DatasetsDecision.new(datasets_decision_params)

    respond_to do |format|
      if @datasets_decision.save
        flash[:notice] = 'Datasets > decision link was successfully created.'
        format.html { redirect_to([:admin,@datasets_decision.dataset, @datasets_decision]) }
        format.xml  { render :xml => @datasets_decision, :status => :created, :location => @datasets_decision }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @datasets_decision.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datasets_decisions/1
  # PUT /datasets_decisions/1.xml
  def update
    @datasets_decision = DatasetsDecision.find(params[:id])

    respond_to do |format|
      if @datasets_decision.update_attributes(datasets_decision_params)
        flash[:notice] = 'DatasetsDecision was successfully updated.'
        format.html { redirect_to([:admin,@datasets_decision]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @datasets_decision.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datasets_decisions/1
  # DELETE /datasets_decisions/1.xml
  def destroy
    @datasets_decision = DatasetsDecision.find(params[:id])
    @dataset = @datasets_decision.dataset
    @datasets_decision.destroy

    respond_to do |format|
      format.html { redirect_to(admin_dataset_datasets_decisions_url @dataset) }
      format.xml  { head :ok }
    end
  end

  # GET the categories for the given decision
  def categories_for_decision
    @decision = Decision.find params[:id]
    @categories = @decision.categories
  end

  private

  def datasets_decision_params
    params.require(:datasets_decision).permit(:dataset_id, :category_id, :decision_id)
  end
end
