# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  def roles
    p "Roles"
  end

  def users_profile_page
    @users = User.find(current_user.id)
  end

  def add_role
    @roles = Role.new(roles_params)
    render plain: 'Success' if @roles.save
  end

  # GET /users/1 or /users/1.json
  def show
    p "Show"
  end

  def update_profile
    @update = User.update(update_params)
    @update.profile_pic.attach(update_params[:profile_pic])
      redirect_to "/user_profile"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
     p "Hello"
  end

  # POST /users or /users.json
  def create
    #user admin email=admin@gmail.com   password  = 123
    @user = User.new(user_params)
    @user[:roles_id] = 3
    if @user.save
      # format.html { redirect_to user_url(@user), notice: "User was successfully created." }
      # format.json { render :show, status: :created, location: @user }
      redirect_to '/login'
    else
      flash[:error] = 'invalid inputs'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :mobile, :email, :password, :password_confirmation, :batch, :profile_pic,
                                 :roles_id)
  end

  def roles_params
    params.require(:roles).permit(:roles_name)
  end

  def update_params
    params.require(:profile).permit(:name, :batch, :email, :mobile)
  end
end
