class SpinsController < ApplicationController
  before_action :set_spin, only: [:show, :edit, :update, :destroy]

  # GET /spins
  # GET /spins.json
  def index
    @spins = Spin.order(created_at: :desc).paginate(:page => params[:page])
  end

  # GET /spins/1
  # GET /spins/1.json
  def show
  end

  # GET /spins/new
  def new
    @spin = Spin.new
  end

  # GET /spins/1/edit
  def edit
  end

  # POST /spins
  # POST /spins.json
  def create
    @spin = Spin.new(spin_params)
    @spin.off_time = Time.now

    respond_to do |format|
      if @spin.save
        format.html { redirect_to @spin, notice: 'Spin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @spin }
      else
        format.html { render action: 'new' }
        format.json { render json: @spin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spins/1
  # PATCH/PUT /spins/1.json
  def update
    @spin.result_time = Time.now
    respond_to do |format|
      if @spin.update(spin_params)
        format.html { redirect_to @spin, notice: 'Spin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @spin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spins/1
  # DELETE /spins/1.json
  def destroy
    @spin.destroy
    respond_to do |format|
      format.html { redirect_to spins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spin
      @spin = Spin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spin_params
      params.require(:spin).permit(:result, :location_id, :user_id, :session_id)
    end
end
