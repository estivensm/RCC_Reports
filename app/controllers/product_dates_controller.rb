class ProductDatesController < ApplicationController
  before_action :set_product_date, only: [:show, :edit, :update, :destroy]

  # GET /product_dates
  # GET /product_dates.json
  def index
    @product_dates = ProductDate.all
  end

  # GET /product_dates/1
  # GET /product_dates/1.json
  def show
  end

  # GET /product_dates/new
  def new
    @product_date = ProductDate.new
  end

  # GET /product_dates/1/edit
  def edit
  end

  # POST /product_dates
  # POST /product_dates.json
  def create
    @product_date = ProductDate.new(product_date_params)

    respond_to do |format|
      if @product_date.save
        format.html { redirect_to @product_date, notice: 'Product date was successfully created.' }
        format.json { render :show, status: :created, location: @product_date }
      else
        format.html { render :new }
        format.json { render json: @product_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_dates/1
  # PATCH/PUT /product_dates/1.json
  def update
    respond_to do |format|
      if @product_date.update(product_date_params)
        format.html { redirect_to @product_date, notice: 'Product date was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_date }
      else
        format.html { render :edit }
        format.json { render json: @product_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_dates/1
  # DELETE /product_dates/1.json
  def destroy
    @product_date.destroy
    respond_to do |format|
      format.html { redirect_to product_dates_url, notice: 'Product date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_date
      @product_date = ProductDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_date_params
      params.require(:product_date).permit(:number, :date, :report_id)
    end
end
