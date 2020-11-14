class BoardAccessesController < ApplicationController
  before_action :set_board_access, only: [:show, :edit, :update, :destroy]

  # GET /board_accesses
  # GET /board_accesses.json
  def index
    @board_accesses = BoardAccess.all
  end

  # GET /board_accesses/1
  # GET /board_accesses/1.json
  def show
  end

  # GET /board_accesses/new
  def new
    @board_access = BoardAccess.new
  end

  # GET /board_accesses/1/edit
  def edit
  end

  # POST /board_accesses
  # POST /board_accesses.json
  def create
    @board_access = BoardAccess.new(board_access_params)

    respond_to do |format|
      if @board_access.save
        format.html { redirect_to @board_access, notice: 'Board access was successfully created.' }
        format.json { render :show, status: :created, location: @board_access }
      else
        format.html { render :new }
        format.json { render json: @board_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_accesses/1
  # PATCH/PUT /board_accesses/1.json
  def update
    respond_to do |format|
      if @board_access.update(board_access_params)
        format.html { redirect_to @board_access, notice: 'Board access was successfully updated.' }
        format.json { render :show, status: :ok, location: @board_access }
      else
        format.html { render :edit }
        format.json { render json: @board_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_accesses/1
  # DELETE /board_accesses/1.json
  def destroy
    @board_access.destroy
    respond_to do |format|
      format.html { redirect_to board_accesses_url, notice: 'Board access was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_access
      @board_access = BoardAccess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_access_params
      params.require(:board_access).permit(:user_id, :board_id)
    end
end
