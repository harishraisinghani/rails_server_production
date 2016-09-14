class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  # GET /destinations
  # GET /destinations.json
  def index
    @destinations = Destination.all
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
  end

  # GET /destinations/new
  def new
    @destination = Destination.new
  end

  # GET /destinations/1/edit
  def edit
  end

  # POST /destinations
  # POST /destinations.json
  def create
    @destination = Destination.new(destination_params)

    respond_to do |format|
      if @destination.save
        format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
        format.json { render :show, status: :created, location: @destination }
      else
        format.html { render :new }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destinations/1
  # PATCH/PUT /destinations/1.json
  def update
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
        format.json { render :show, status: :ok, location: @destination }
      else
        format.html { render :edit }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination.destroy
    respond_to do |format|
      format.html { redirect_to destinations_url, notice: 'Destination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_all_active_alerts
    all_current_checkins = Destination.find(current_dispatcher.destination_id).checkins.where(checkout: nil)
    all_on_shift_patrollers = Destination.find(current_dispatcher.destination_id).patrollers.where(on_shift: true)
    @active_alerts = []
    @alert_pings = []
    @skier_names = []
    @skier_ids = []
    @on_shift_patrollers = []
    all_on_shift_patrollers.each do |patroller|
      @on_shift_patrollers << patroller
    end
    all_current_checkins.each do |checkin|
      pings = checkin.pings
      pings.each do |ping|
        temp_alert = Alert.find_by(ping_id: ping.id, state: 'active')
        if temp_alert
          @active_alerts << temp_alert
          @alert_pings << ping
          @skier_names << temp_alert.ping.checkin.skier.firstname + ' ' + temp_alert.ping.checkin.skier.lastname
          @skier_ids << temp_alert.ping.checkin.skier.id
        end
      end
    end
    render json: [@active_alerts, @alert_pings, @skier_names, @skier_ids, @on_shift_patrollers]
  end

  def get_all_recent_pings
    @recent_pings = []
    destination_checkins = Checkin.where(destination_id: Dispatcher.find(session[:dispatcher_id]).destination_id, checkout: nil)
    destination_checkins.each do |checkin| 
      @recent_pings << checkin.pings.last 
    end
    render json: @recent_pings
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_params
      params.require(:destination).permit(:name, :lat, :long, :radius)
    end
end
