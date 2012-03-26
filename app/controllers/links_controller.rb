class LinksController < ApplicationController
  # GET /links
  # GET /links.json
  
  
  def index
    @links = Link.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link }
    end
  end
  
  def feed
      
      # this will be the name of the feed displayed on the feed reader
      @title = "LinkOverload"

      # the links
      @links = Link.all

      # this will be our Feed's update timestamp
      @updated = @links.last.updated_at unless @links.empty?

      respond_to do |format|
        format.atom { render :layout => false }
        # we want the RSS feed to redirect permanently to the ATOM feed
        format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
      end
  end
  

  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        flash[:success] = "Successfully Added Link."
        format.html { redirect_to action: "index" }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:warning] = "Successfully Removed Link."

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end
end
