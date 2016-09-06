class MergesController < ApplicationController
  before_action :set_merge, only: [:show, :edit, :update, :destroy]

  # GET /merges
  # GET /merges.json
  def index
    @merges = Merge.all
  end

  # GET /merges/1
  # GET /merges/1.json
  def show
  end

  # GET /merges/new
  def new
    @merge = Merge.new
  end

  # GET /merges/1/edit
  def edit
  end

  # POST /merges
  # POST /merges.json
  def create
    @merge = Merge.new(merge_params)

    respond_to do |format|
      if @merge.save
        format.html { redirect_to @merge, notice: 'Merge was successfully created.' }
        format.json { render :show, status: :created, location: @merge }
      else
        format.html { render :new }
        format.json { render json: @merge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merges/1
  # PATCH/PUT /merges/1.json
  def update
    respond_to do |format|
      if @merge.update(merge_params)
        format.html { redirect_to @merge, notice: 'Merge was successfully updated.' }
        format.json { render :show, status: :ok, location: @merge }
      else
        format.html { render :edit }
        format.json { render json: @merge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merges/1
  # DELETE /merges/1.json
  def destroy
    @merge.destroy
    respond_to do |format|
      format.html { redirect_to merges_url, notice: 'Merge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merge
      @merge = Merge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merge_params
      params.require(:merge).permit(:name)
    end
end
