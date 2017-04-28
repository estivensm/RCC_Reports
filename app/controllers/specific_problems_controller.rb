class SpecificProblemsController < ApplicationController
  before_action :set_specific_problem, only: [:show, :edit, :update, :destroy]

  # GET /specific_problems
  # GET /specific_problems.json
  def index
    @specific_problems = SpecificProblem.all
  end

  # GET /specific_problems/1
  # GET /specific_problems/1.json
  def show
  end

  # GET /specific_problems/new
  def new
    @specific_problem = SpecificProblem.new
  end

  # GET /specific_problems/1/edit
  def edit
  end

  # POST /specific_problems
  # POST /specific_problems.json
  def create
    @specific_problem = SpecificProblem.new(specific_problem_params)

    respond_to do |format|
      if @specific_problem.save
        format.html { redirect_to @specific_problem, notice: 'Specific problem was successfully created.' }
        format.json { render :show, status: :created, location: @specific_problem }
      else
        format.html { render :new }
        format.json { render json: @specific_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specific_problems/1
  # PATCH/PUT /specific_problems/1.json
  def update
    respond_to do |format|
      if @specific_problem.update(specific_problem_params)
        format.html { redirect_to @specific_problem, notice: 'Specific problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @specific_problem }
      else
        format.html { render :edit }
        format.json { render json: @specific_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specific_problems/1
  # DELETE /specific_problems/1.json
  def destroy
    @specific_problem.destroy
    respond_to do |format|
      format.html { redirect_to specific_problems_url, notice: 'Specific problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def delete_specific_problems
    SpecificProblem.where(:id => params[:specific_problem_ids]).destroy_all
    respond_to do |format|
    format.html { redirect_to specific_problems_path }
    format.json { head :no_content }
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specific_problem
      @specific_problem = SpecificProblem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specific_problem_params
      params.require(:specific_problem).permit(:name)
    end
end
