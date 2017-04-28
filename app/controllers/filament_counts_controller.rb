class FilamentCountsController < ApplicationController
  before_action :set_filament_count, only: [:show, :edit, :update, :destroy]

  # GET /filament_counts
  # GET /filament_counts.json
  def index
    @filament_counts = FilamentCount.all
  end

  # GET /filament_counts/1
  # GET /filament_counts/1.json
  def show
  end

  # GET /filament_counts/new
  def new
    @filament_count = FilamentCount.new
  end

  # GET /filament_counts/1/edit
  def edit
  end

  # POST /filament_counts
  # POST /filament_counts.json
  def create
    @filament_count = FilamentCount.new(filament_count_params)

    respond_to do |format|
      if @filament_count.save
        format.html { redirect_to @filament_count, notice: 'Filament count was successfully created.' }
        format.json { render :show, status: :created, location: @filament_count }
      else
        format.html { render :new }
        format.json { render json: @filament_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /filament_counts/1
  # PATCH/PUT /filament_counts/1.json
  def update
    respond_to do |format|
      if @filament_count.update(filament_count_params)
        format.html { redirect_to @filament_count, notice: 'Filament count was successfully updated.' }
        format.json { render :show, status: :ok, location: @filament_count }
      else
        format.html { render :edit }
        format.json { render json: @filament_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filament_counts/1
  # DELETE /filament_counts/1.json
  def destroy
    @filament_count.destroy
    respond_to do |format|
      format.html { redirect_to filament_counts_url, notice: 'Filament count was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
def delete_filament_counts
    FilamentCount.where(:id => params[:filament_count_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to filament_counts_path }
    format.json { head :no_content }
  end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filament_count
      @filament_count = FilamentCount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def filament_count_params
      params.require(:filament_count).permit(:name)
    end
end
