class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]


  before_action :authenticate_user!

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end
  
  def seguimientos_all
    @report = Report.find(params[:id])
    @seguimientos = @report.seguimientos
    
  end


  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  
 
  # GET /reports/new
  def new
   
      @num = Report.maximum(:count)
    if @num != nil
        @num = @num + 1

    else
        @num = 1001
    end
    @ano = Time.now.year.to_s
    @ano = @ano.remove("20") 
    @count = @num
    @code= "#{@num}-#{@ano}-MAG-CO" 
    @report = Report.new
  
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


def destroy_multiple

Report.destroy(params[:reports])

respond_to do |format|
 format.html { redirect_to blog_posts_path }
 format.json { head :no_content }
end
end

  def get_country

      @report = Plant.find(params[:id])
      render :json => @report;

    
  end

  def tracing_report
    @report = Report.find(params[:id])
    @seguimientos = @report.seguimientos
    @seguimiento = Seguimiento.new
  end
  
  def create_tracing

    @seguimiento = Seguimiento.new 
    @seguimiento.description = params[:description]
    @seguimiento.attachment = params[:attachment]
    @seguimiento.report_id =  params[:report_id]
     @seguimiento.save
      if @seguimiento.save
        redirect_to :back, notice: "creaste un nuevo tracing"
      end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:count, :code, :autor, :product_name, :customer_report_date, :report_start_date, :plant_id, :title, :value, :decitex, :denier, :yarn_type_id, :merge_id, :filament_count_id, :segment, :customer_end_use, :invoice_invista, :invoice_mag, :quantity_shipped, :quantity_affected, :return_potential, :return_value, :claim_potential, :claim_value, :customer_id, :reporter, :phone, :email, :source, :specific_problem_id, :description_problem, :preliminary_investigation, :preliminary_conclusions, :research_results, :conclusions_plant, :action_plan, :close_claim, :date_close, :validation_claim ,product_images_attributes: [:id, :number, :description, :image, :_destroy],product_dates_attributes: [:id, :number, :date, :_destroy] )
    end
end
