class ImagegalsController < ApplicationController
  before_action :set_imagegal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:galleryimage, :tagged]
  # GET /imagegals
  # GET /imagegals.json
  def index
    @q = Imagegal.ransack(params[:q])
    if current_user && current_user.admin?
      @imagegals = Imagegal.all.page(params[:page])
      @imagegals = @q.result.page(params[:page])
    elsif current_user
      @imagegals = current_user.imagegals.page(params[:page])
      @q = current_user.imagegals.ransack(params[:q])
      @imagegals = @q.result.page(params[:page])
    end
    
    
  end

  # GET /imagegals/1
  # GET /imagegals/1.json
  def show
    
  end
  def galleryimage
    
    if current_user && current_user.admin?
      @imagegals = Imagegal.all.page(params[:page])
    elsif current_user
      @imagegals = current_user.imagegals.page(params[:page])
    else
      @imagegals = Imagegal.all.page(params[:page])
    end

    if valid_page?
      render template: "imagegals/galleryimage"
    else
      render file: "public/404.html", status: :not_found
    end
  end
  
  

  # GET /imagegals/new
  def new
    @imagegal = Imagegal.new
  end

  # GET /imagegals/1/edit
  def edit
  end
  def display
    
  end
  
  # POST /imagegals
  # POST /imagegals.json
  def create
    @imagegal = Imagegal.new(imagegal_params)
    @imagegal.user = current_user
    respond_to do |format|0
      if @imagegal.save
        ImagegalMailer.new_imagegal(@imagegal).deliver_now
        format.html { redirect_to @imagegal, notice: 'Imagegal was successfully created.' }
        format.json { render :show, status: :created, location: @imagegal }
      else
        format.html { render :new }
        format.json { render json: @imagegal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imagegals/1
  # PATCH/PUT /imagegals/1.json
  def update
    respond_to do |format|
      if @imagegal.update(imagegal_params)
        if current_user.admin?
          ImagegalMailer.update_imagegal(@imagegal).deliver_now
        end
        
        format.html { redirect_to @imagegal, notice: 'Imagegal was successfully updated.' }
        format.json { render :show, status: :ok, location: @imagegal }
      else
        format.html { render :edit }
        format.json { render json: @imagegal.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def tagged
    if params[:tag].present?
      @imagegals= Imagegal.tagged_with(params[:tag]).page( params[:page])
      if current_user && current_user.admin?
        @q = Imagegal.ransack(params[:q])
        @imagegals = @q.result.tagged_with(params[:tag]).page(params[:page])
      elsif current_user
        @q = current_user.imagegals.ransack(params[:q])
        @imagegals = @q.result.tagged_with(params[:tag]).page(params[:page])
      end
     
      render :index
    else
      @imagegalleries = Imagegal.all.page( params[:page]) 
    end
  end
  

  # DELETE /imagegals/1
  # DELETE /imagegals/1.json
  def destroy
    
    if params[:attachment_id]
      @imagegal.files.find_by_id(params[:attachment_id]).purge
    
    # handle purge all
    elsif params[:purge]
      @imagegal.files.purge
      
    # handle destroy resource
    else
      @imagegal.destroy
      
    end
    
    respond_to do |format|
      if current_user.admin?
        ImagegalMailer.destroy_imagegal(@imagegal).deliver_now
      end
      
      format.html { redirect_to imagegals_url, notice: 'Imagegal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def valid_page?
      File.exist?(Pathname.new(Rails.root + "app/views/imagegals/galleryimage.html.erb"))
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_imagegal
      @imagegal = Imagegal.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def imagegal_params
      params.require(:imagegal).permit(:title, :caption, :image, :tag_list)
    end
end
