class SkiersController < ApplicationController
  before_action :set_skier, only: [:show, :edit, :update, :destroy]

  # GET /skiers
  # GET /skiers.json
  def index
    @skiers = Skier.all
  end

  # GET /skiers/1
  # GET /skiers/1.json
  def show
  end

  # GET /skiers/new
  def new
    @skier = Skier.new
  end

  # GET /skiers/1/edit
  def edit
  end

  # POST /skiers
  # POST /skiers.json
  def create
    @skier = Skier.new(skier_params)

    respond_to do |format|
      if @skier.save
        format.html { redirect_to @skier, notice: 'Skier was successfully created.' }
        format.json { render :show, status: :created, location: @skier }
      else
        format.html { render :new }
        format.json { render json: @skier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skiers/1
  # PATCH/PUT /skiers/1.json
  def update
    respond_to do |format|
      if @skier.update(skier_params)
        format.html { redirect_to @skier, notice: 'Skier was successfully updated.' }
        format.json { render :show, status: :ok, location: @skier }
      else
        format.html { render :edit }
        format.json { render json: @skier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skiers/1
  # DELETE /skiers/1.json
  def destroy
    @skier.destroy
    respond_to do |format|
      format.html { redirect_to skiers_url, notice: 'Skier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skier
      @skier = Skier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skier_params
      params.require(:skier).permit(:firstname, :lastname, :email, :password, :password_confirmation, :ec1, :ec1phone, :ec2, :ec2phone, :current_checkin_id, :username, :profile_picture, :phone)
    end
end
