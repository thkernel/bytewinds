class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit, :update, :destroy]
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  #add_breadcrumb "Accueil", :root_path

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    puts "PAGE TO SHOW: #{@page.inspect}"
    @page_title = @page.title
    @page_description = @page.content
    
    render layout: "front"
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  

  

  

  

  

  
  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = current_user.pages.build(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_path, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @page = Page.friendly.find(params[:page_id])
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to pages_path, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title,  :content, :status)
    end
end
