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

  #Custom Skier methods

  #Get all the pings associated with a specific skier. This will be used for logic to determine if alert is raised and last ping lat/long data.
  def skier_pings_index 
    @pings = Skier.find(params[:id]).pings
    render json: @pings 
  end

  #Skier checks out closing the checkin object
  def skier_checkout
    current_skier = Skier.find(params[:id])
    checkin_to_update = Checkin.find(current_skier.current_checkin_id) 
    checkin_to_update.checkout= Time.now
    current_skier.current_checkin_id = nil
    
    if checkin_update.save && current_skier.save
      render json: "Current user successfully checked out"
    end
  end

  #Any skier can create a new group. This will be a post request. The URL post will contain email addresses of the users that memberships are created for. 
  def new_group
    @membership_ids = []
    group = Group.create(admin_id: params[:id], name: params[:name])

    #Create admin membership
    admin_membership = Membership.create(skier_id: params[:id], group_id: group.id)

    params.each do |key,value|
      if /email/.match(key)
        member = Membership.create(skier_id: Skier.find_by(email: value).id, group_id: group.id)
        @membership_ids << member.id
      end
    end
    render json: @membership_ids
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
