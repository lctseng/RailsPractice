class PersionsController < ApplicationController
  before_action :set_persion, only: [:show, :edit, :update, :destroy]

  # GET /persions
  # GET /persions.json
  def index
    @persions = Persion.all
  end

  # GET /persions/1
  # GET /persions/1.json
  def show
  end

  # GET /persions/new
  def new
    @persion = Persion.new
  end

  # GET /persions/1/edit
  def edit
  end

  # POST /persions
  # POST /persions.json
  def create
    @persion = Persion.new(persion_params)

    respond_to do |format|
      if @persion.save
        format.html { redirect_to @persion, notice: 'Persion was successfully created.' }
        format.json { render :show, status: :created, location: @persion }
      else
        format.html { render :new }
        format.json { render json: @persion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /persions/1
  # PATCH/PUT /persions/1.json
  def update
    respond_to do |format|
      if @persion.update(persion_params)
        format.html { redirect_to @persion, notice: 'Persion was successfully updated.' }
        format.json { render :show, status: :ok, location: @persion }
      else
        format.html { render :edit }
        format.json { render json: @persion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /persions/1
  # DELETE /persions/1.json
  def destroy
    @persion.destroy
    respond_to do |format|
      format.html { redirect_to persions_url, notice: 'Persion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persion
      @persion = Persion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persion_params
      params.require(:persion).permit(:name, :bio, :birthday)
    end
end
