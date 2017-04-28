class YarnTypesController < ApplicationController
  before_action :set_yarn_type, only: [:show, :edit, :update, :destroy]

  # GET /yarn_types
  # GET /yarn_types.json
  def index
    @yarn_types = YarnType.all
  end

  # GET /yarn_types/1
  # GET /yarn_types/1.json
  def show
  end

  # GET /yarn_types/new
  def new
    @yarn_type = YarnType.new
  end

  # GET /yarn_types/1/edit
  def edit
  end

  # POST /yarn_types
  # POST /yarn_types.json
  def create
    @yarn_type = YarnType.new(yarn_type_params)

    respond_to do |format|
      if @yarn_type.save
        format.html { redirect_to @yarn_type, notice: 'Yarn type was successfully created.' }
        format.json { render :show, status: :created, location: @yarn_type }
      else
        format.html { render :new }
        format.json { render json: @yarn_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yarn_types/1
  # PATCH/PUT /yarn_types/1.json
  def update
    respond_to do |format|
      if @yarn_type.update(yarn_type_params)
        format.html { redirect_to @yarn_type, notice: 'Yarn type was successfully updated.' }
        format.json { render :show, status: :ok, location: @yarn_type }
      else
        format.html { render :edit }
        format.json { render json: @yarn_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yarn_types/1
  # DELETE /yarn_types/1.json
  def destroy
    @yarn_type.destroy
    respond_to do |format|
      format.html { redirect_to yarn_types_url, notice: 'Yarn type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
def delete_yarns
    YarnType.where(:id => params[:yarn_type_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to yarn_types_path }
    format.json { head :no_content }
  end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yarn_type
      @yarn_type = YarnType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yarn_type_params
      params.require(:yarn_type).permit(:name)
    end
end
