class ItemDataController < ApplicationController
  before_action :set_item_datum, only: [:show, :edit, :update, :destroy]

  # GET /item_data
  # GET /item_data.json
  def index
    @item_data = ItemDatum.all
  end

  # GET /item_data/1
  # GET /item_data/1.json
  def show
  end

  # GET /item_data/new
  def new
    @item_datum = ItemDatum.new
  end

  # GET /item_data/1/edit
  def edit
  end

  # POST /item_data
  # POST /item_data.json
  def create
    @item_datum = ItemDatum.new(item_datum_params)

    respond_to do |format|
      if @item_datum.save
        format.html { redirect_to @item_datum, notice: 'Item datum was successfully created.' }
        format.json { render :show, status: :created, location: @item_datum }
      else
        format.html { render :new }
        format.json { render json: @item_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_data/1
  # PATCH/PUT /item_data/1.json
  def update
    respond_to do |format|
      if @item_datum.update(item_datum_params)
        format.html { redirect_to @item_datum, notice: 'Item datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_datum }
      else
        format.html { render :edit }
        format.json { render json: @item_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_data/1
  # DELETE /item_data/1.json
  def destroy
    @item_datum.destroy
    respond_to do |format|
      format.html { redirect_to item_data_url, notice: 'Item datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_datum
      @item_datum = ItemDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_datum_params
      params.require(:item_datum).permit(:data, :item_id)
    end
end
