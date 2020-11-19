module Api
  class UserController < ApplicationController
    before_action :authenticate_user
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # GET /users
    # GET /users.json
    def index
      # @users = User.all
      puts "test"
      render json: {error: "User doesn't exist"}, status: 404
    end

    # GET /users/1
    # GET /users/1.json
    def show
      puts "test"
      render json: ["User doesn't exist"], status: 404
    end

    # GET /users/new
    def new
      @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    # POST /users.json
    def create
      puts user_params
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          render json: {message: "User created"}, status: 200
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
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
        # @user = User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:id, :email, :username, :password)
      end
  end
end