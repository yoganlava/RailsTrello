module Api
  class CardTableController < ApplicationController
    before_action :authenticate_user
    before_action :set_card_table, only: [:show, :edit, :update, :destroy]

    # GET /card_tables
    # GET /card_tables.json
    def index
      @card_tables = CardTable.all
    end

    # GET /card_tables/1
    # GET /card_tables/1.json
    def show
    end

    # GET /card_tables/new
    def new
      @card_table = CardTable.new
    end

    # GET /card_tables/1/edit
    def edit
    end

    # POST /card_tables
    # POST /card_tables.json
    def create
      @card_table = CardTable.new(card_table_params)

      respond_to do |format|
        if @card_table.save
          format.html { redirect_to @card_table, notice: 'Card table was successfully created.' }
          format.json { render :show, status: :created, location: @card_table }
        else
          format.html { render :new }
          format.json { render json: @card_table.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /card_tables/1
    # PATCH/PUT /card_tables/1.json
    def update
      respond_to do |format|
        if @card_table.update(card_table_params)
          format.html { redirect_to @card_table, notice: 'Card table was successfully updated.' }
          format.json { render :show, status: :ok, location: @card_table }
        else
          format.html { render :edit }
          format.json { render json: @card_table.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /card_tables/1
    # DELETE /card_tables/1.json
    def destroy
      @card_table.destroy
      respond_to do |format|
        format.html { redirect_to card_tables_url, notice: 'Card table was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_card_table
        @card_table = CardTable.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def card_table_params
        params.require(:card_table).permit(:column_index, :name)
      end
  end
end