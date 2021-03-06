class SeguimientosController < ApplicationController
  before_action :set_seguimiento, only: [:show, :edit, :update, :destroy]

  # GET /seguimientos
  # GET /seguimientos.json
  def index
    @seguimientos = Seguimiento.all
  end

  # GET /seguimientos/1
  # GET /seguimientos/1.json
  def show
  end

  # GET /seguimientos/new
  def new
    @report = Report.find(params[:report_id])
    @seguimiento = Seguimiento.new
  end

  # GET /seguimientos/1/edit
  def edit
     @report = Report.find(params[:report_id])
  end

  # POST /seguimientos
  # POST /seguimientos.json
  def create
   @report = Report.find(params[:report_id])
    @seguimiento = Seguimiento.new(seguimiento_params)

    if @seguimiento.save
      redirect_to seguimientos_all_path(@report)
    end
  end

  # PATCH/PUT /seguimientos/1
  # PATCH/PUT /seguimientos/1.json
  def update
    @report = Report.find(params[:report_id])
   if @seguimiento.update(seguimiento_params)
        redirect_to seguimientos_all_path(@report)
         end
  end

  # DELETE /seguimientos/1
  # DELETE /seguimientos/1.json
  def destroy
       @report = Report.find(params[:report_id])

    @seguimiento.destroy
    respond_to do |format|
      format.html { redirect_to seguimientos_all_path(@report), notice: 'Seguimiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seguimiento
      @seguimiento = Seguimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seguimiento_params
      params.require(:seguimiento).permit(:attachment, :description, :report_id)
    end
end
