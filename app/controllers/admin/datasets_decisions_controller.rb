class Admin::DatasetsDecisionsController < Admin::ApplicationController
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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @decision }
    end
  end

  # GET /decisions/1/edit
  def edit
    @datasets_decision = DatasetsDecision.find(params[:id])
  end

  # POST /datasets_decisions
  # POST /datasets_decisions.xml
  def create
    @datasets_decision = DatasetsDecision.new(params[:datasets_decision])

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
      if @datasets_decision.update_attributes(params[:datasets_decision])
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
end
