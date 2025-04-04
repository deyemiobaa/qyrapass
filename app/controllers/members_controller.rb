class MembersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_member, only: %i[ edit update destroy ]

  # GET /members or /members.json
  def index
    @members = Member.order(updated_at: :desc)
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)

    @member.uid = member_params["email"]
    @member.password = ENV["DEFAULT_PASSWORD"]
    @member.password_confirmation = ENV["DEFAULT_PASSWORD"]

    respond_to do |format|
      if @member.save
        @member.send_confirmation_instructions
        format.html { redirect_to members_path, notice: "Member was successfully created." }
        format.json { render :index, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to members_path, notice: "Member was successfully updated." }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy!

    respond_to do |format|
      format.html { redirect_to members_path, status: :see_other, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.expect(member: [ :name, :email, :phone, :last_signed_in, :access_expiry_date, :is_active ])
    end
end
