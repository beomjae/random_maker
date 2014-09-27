class ItemDatasController < ApplicationController
  before_action :set_item_data, only: [:show, :edit, :update, :destroy]

  # GET /item_data
  # GET /item_data.json
  def index
    item_id = params[:item_id]
    unless item_id.present?
      redirect_to projects_path
    end

    @item_data = ItemData.where(item_id: item_id)
  end

  # GET /item_data/1
  # GET /item_data/1.json
  def show
  end

  # GET /item_data/new
  def new
    item_id = params[:item_id]
    unless item_id.present?
      redirect_to projects_path
    end
    @item = Item.find(item_id)

    @item_data = @item.item_datas.new
  end

  # GET /item_data/1/edit
  def edit
  end

  # POST /item_data
  # POST /item_data.json
  def create
    @item_data = ItemData.new(item_data_params)

    respond_to do |format|
      if @item_data.save
        format.html { redirect_to @item_data, notice: 'Item datum was successfully created.' }
        format.json { render :show, status: :created, location: @item_data }
      else
        format.html { render :new }
        format.json { render json: @item_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_data/1
  # PATCH/PUT /item_data/1.json
  def update
    respond_to do |format|
      if @item_data.update(item_data_params)
        format.html { redirect_to @item_data, notice: 'Item datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_data }
      else
        format.html { render :edit }
        format.json { render json: @item_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_data/1
  # DELETE /item_data/1.json
  def destroy
    @item_data.destroy
    respond_to do |format|
      format.html { redirect_to item_data_url, notice: 'Item datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_data
      @item_data = ItemData.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_data_params
      params.require(:item_data).permit(:data, :item_id)
    end
end
