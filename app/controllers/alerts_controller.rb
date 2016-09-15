class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]

  # GET /alerts
  # GET /alerts.json
  def index
    @alerts = Alert.all
  end

  # GET /alerts/1
  # GET /alerts/1.json
  def show
  end

  # GET /alerts/new
  def new
    @alert = Alert.new
  end

  # GET /alerts/1/edit
  def edit
  end

  # POST /alerts
  # POST /alerts.json
  def create
    current_dispatcher_id = Dispatcher.find_by(on_shift: true)
    @alert = Alert.new(alert_params, state: "active", dispatcher_id: current_dispatcher_id)

    respond_to do |format|
      if @alert.save
        format.html { redirect_to @alert, notice: 'Alert was successfully created.' }
        format.json { render :show, status: :created, location: @alert }
      else
        format.html { render :new }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1
  # PATCH/PUT /alerts/1.json
  def update
    respond_to do |format|
      if @alert.update(alert_params)
        format.html { redirect_to @alert, notice: 'Alert was successfully updated.' }
        format.json { render :show, status: :ok, location: @alert }
      else
        format.html { render :edit }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    @alert.destroy
    respond_to do |format|
      format.html { redirect_to alerts_url, notice: 'Alert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def request_assistance
    requested_alert_ping = Ping.new(checkin_id: Skier.find(params[:id]).current_checkin_id, lat: params["lat"], long: params["lng"])

    requested_alert_ping.save

    requested_alert = Alert.new(user_generated: true, state: "active",dispatcher_id: Dispatcher.find_by(on_shift: true, destination_id: requested_alert_ping.checkin.destination_id).id, ping_id: requested_alert_ping.id, patroller_id: 1)

    if requested_alert.save
      render json: "help is on the way"
    else
      render json: requested_alert.errors
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:alert).permit(:false_alarm, :user_generated, :state, :dispatcher_id, :patroller_id, :ping_id)
    end
end
