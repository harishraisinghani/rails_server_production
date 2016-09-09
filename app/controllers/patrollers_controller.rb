class PatrollersController < ApplicationController
  before_action :set_patroller, only: [:show, :edit, :update, :destroy]

  # GET /patrollers
  # GET /patrollers.json
  def index
    @patrollers = Patroller.all
  end

  # GET /patrollers/1
  # GET /patrollers/1.json
  def show
  end

  # GET /patrollers/new
  def new
    @patroller = Patroller.new
  end

  # GET /patrollers/1/edit
  def edit
  end

  # POST /patrollers
  # POST /patrollers.json
  def create
    @patroller = Patroller.new(patroller_params)

    respond_to do |format|
      if @patroller.save
        format.html { redirect_to @patroller, notice: 'Patroller was successfully created.' }
        format.json { render :show, status: :created, location: @patroller }
      else
        format.html { render :new }
        format.json { render json: @patroller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patrollers/1
  # PATCH/PUT /patrollers/1.json
  def update
    respond_to do |format|
      if @patroller.update(patroller_params)
        format.html { redirect_to @patroller, notice: 'Patroller was successfully updated.' }
        format.json { render :show, status: :ok, location: @patroller }
      else
        format.html { render :edit }
        format.json { render json: @patroller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patrollers/1
  # DELETE /patrollers/1.json
  def destroy
    @patroller.destroy
    respond_to do |format|
      format.html { redirect_to patrollers_url, notice: 'Patroller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #Custom methods
  def receive_alert
    alert = Alert.find_by(patroller_id: params[:id], state: 'active') 
    skier_name = alert.ping.checkin.skier.firstname + " " + alert.ping.checkin.skier.lastname
    @person = 
    { 
      lat: alert.ping.lat,
      long: alert.ping.long,
      name: skier_name
    }
    render json: @person
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patroller
      @patroller = Patroller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patroller_params
      params.require(:patroller).permit(:firstname, :lastname, :username, :password, :password_confirmation, :on_shift, :destination_id)
    end
end
