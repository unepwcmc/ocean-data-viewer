class Admin::DecisionsController < Admin::AdminController
  # GET /decisions
  # GET /decisions.xml
  def index
    @decisions = Decision.all.order("order_number ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @decisions }
    end
  end

  # GET /decisions/1
  # GET /decisions/1.xml
  def show
    @decision = Decision.find(params[:id])
    @categories = @decision.categories

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @decision }
    end
  end

  # GET /decisions/new
  # GET /decisions/new.xml
  def new
    @decision = Decision.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @decision }
    end
  end

  # GET /decisions/1/edit
  def edit
    @decision = Decision.find(params[:id])
  end

  # POST /decisions
  # POST /decisions.xml
  def create
    @decision = Decision.new(decision_params)

    respond_to do |format|
      if @decision.save
        flash[:notice] = 'Decision was successfully created.'
        format.html { redirect_to([:admin,@decision]) }
        format.xml  { render :xml => @decision, :status => :created, :location => @decision }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @decision.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /decisions/1
  # PUT /decisions/1.xml
  def update
    @decision = Decision.find(params[:id])

    respond_to do |format|
      if @decision.update_attributes(decision_params)
        flash[:notice] = 'Decision was successfully updated.'
        format.html { redirect_to([:admin,@decision]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @decision.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /decisions/1
  # DELETE /decisions/1.xml
  def destroy
    @decision = Decision.find(params[:id])
    @decision.destroy

    respond_to do |format|
      format.html { redirect_to(admin_decisions_url) }
      format.xml  { head :ok }
    end
  end

  private

  def decision_params
    params.require(:decision).permit(:name, :short_name, :short_desc, :description, :parent_id, :established, :key_points, :links, :order_number)
  end
end
