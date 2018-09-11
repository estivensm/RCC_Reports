class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]


  before_action :authenticate_user!

  # GET /reports
  # GET /reports.json
  def index
     @plants = Plant.all
     @yarns = YarnType.all
    @merges = Merge.all
    @filaments = FilamentCount.all
    @customers = Customer.all
    @problems = SpecificProblem.all
  if params[:search] || params[:search1] || params[:search2] || params[:search3]|| params[:search4] || params[:search5] || params[:search6]

    @reports1 = Report.search(params[:search],params[:search1],params[:search2],params[:search3],params[:search4],params[:search5],params[:search6]).order(created_at: :desc)

  else 
      
       @reports1 = Report.all.order(created_at: :desc)

  end

@reports = @reports1.paginate(page: params[:page],:per_page => 30)

  end
  
  def seguimientos_all

    @report = Report.find(params[:id])
    @seguimientos = @report.seguimientos
    
  end


  # GET /reports/1
  # GET /reports/1.json
  def show
     @plants = Plant.all
     @yarns = YarnType.all
    @merges = Merge.all
    @filaments = FilamentCount.all
    @customers = Customer.all
    @problems = SpecificProblem.all
    @array_use = ""
    a = ["Intimate Apparel", "Swimwear", "Legwear", "Ready to Wear", "Bandages"]
    a.each do |use|
      if @report.customer_end_use[use]
          @array_use = @array_use + use + ","
       end
    end
    @array_segment = ""
    b = ["Core Spinnig", "Weaving", "Circular Knit", "Covering", "Direct Knit", "Warp Knitting", "Raschel", "Seamless" , "Narrows"]
    b.each do |use|
      if @report.segment[use]
          @array_segment = @array_segment + use + ","
      end
    end  
      respond_to do |format|
        format.html
        format.pdf do
          render :pdf => 'file_name',
          :template => 'reports/pdfs/report.pdf.erb',
          :layout => 'pdf.html.erb',
          margin: {
                      top: 30
                      },
          :header => {
                    :spacing => 5,
                    :html => {
                      :template => 'layouts/pdf_header.html'
                    },

                    },
                    :footer => {
                      :spacing => 5,
                    :html => {
                      :template => 'layouts/pdf_footer.html.erb'
                    }
                },
          :show_as_html => params[:debug].present?
        end
      end
    



  end

  
 
  # GET /reports/new
  def new
   @plants = Plant.all
   @yarns = YarnType.all
   @merges = Merge.all
   @filaments = FilamentCount.all
   @customers = Customer.all
   @problems = SpecificProblem.all
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
    @plants = Plant.all
    @yarns = YarnType.all
    @merges = Merge.all
    @filaments = FilamentCount.all
    @customers = Customer.all
    @problems = SpecificProblem.all
    @code = @report.code
    @array_use = Array.new
    a = ["Intimate Apparel", "Swimwear", "Legwear", "Ready to Wear", "Bandages"]
    a.each do |use|
      if @report.customer_end_use[use]
          @array_use.push(use)
       end
    end
    @array_segment = Array.new
    b = ["Core Spinnig", "Weaving", "Circular Knit", "Covering", "Direct Knit", "Warp Knitting", "Raschel", "Seamless" , "Narrows"]
    b.each do |use|
      if @report.segment[use]
          @array_segment.push(use)
      end
    end  
end



  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
     @plants = Plant.all
     @yarns = YarnType.all
    @merges = Merge.all
    @filaments = FilamentCount.all
    @customers = Customer.all
    @problems = SpecificProblem.all
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
    @yarns = YarnType.all
    @merges = Merge.all
    @filaments = FilamentCount.all
    @customers = Customer.all
    @problems = SpecificProblem.all
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

def create_plant
  
   a =  Plant.new(name:params[:name], country:params[:country])
   a.save
   @plants = Plant.all.order(created_at: :desc)


end
def create_yarn
  
   a =  YarnType.new(name:params[:name])
   a.save
   @yarns = YarnType.all.order(created_at: :desc)

end

def create_merge
  
   a =  Merge.new(name:params[:name])
   a.save
   @merges = Merge.all.order(created_at: :desc)

end

def create_filament
  
   a =  FilamentCount.new(name:params[:name])
   a.save
   @filaments = FilamentCount.all.order(created_at: :desc)

end

def create_customer
  
   a =  Customer.new(name:params[:name],country:params[:country],address:params[:address],city:params[:city])
   a.save
   @customers = Customer.all.order(created_at: :desc)

end

def create_problem
  
   a =  SpecificProblem.new(name:params[:name])
   a.save
   @problems = SpecificProblem.all.order(created_at: :desc)

end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:count, :code, :autor, :product_name, :customer_report_date, :report_start_date, :plant_id, :title, :value, :decitex, :denier, :yarn_type_id, :merge_id, :filament_count_id, {:segment => []}, {:customer_end_use => []}, :invoice_invista, :invoice_mag, :quantity_shipped, :quantity_affected, :return_potential, :return_value, :claim_potential, :claim_value, :customer_id, :reporter, :phone, :email, :source, :specific_problem_id, :description_problem, :preliminary_investigation, :preliminary_conclusions, :research_results, :conclusions_plant, :action_plan, :close_claim, :date_close, :validation_claim ,product_images_attributes: [:id, :number, :description, :image, :_destroy],product_dates_attributes: [:id, :number, :date, :_destroy] )
    end
end
