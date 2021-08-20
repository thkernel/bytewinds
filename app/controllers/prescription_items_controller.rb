class PrescriptionItemsController < ApplicationController
  before_action :set_prescription_item, only: %i[ show edit update destroy ]

  # GET /prescription_items or /prescription_items.json
  def index
    @prescription_items = PrescriptionItem.all
  end

  # GET /prescription_items/1 or /prescription_items/1.json
  def show
  end

  # GET /prescription_items/new
  def new
    @prescription_item = PrescriptionItem.new
  end

  # GET /prescription_items/1/edit
  def edit
  end

  # POST /prescription_items or /prescription_items.json
  def create
    @prescription_item = PrescriptionItem.new(prescription_item_params)

    respond_to do |format|
      if @prescription_item.save
        format.html { redirect_to @prescription_item, notice: "Prescription item was successfully created." }
        format.json { render :show, status: :created, location: @prescription_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prescription_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescription_items/1 or /prescription_items/1.json
  def update
    respond_to do |format|
      if @prescription_item.update(prescription_item_params)
        format.html { redirect_to @prescription_item, notice: "Prescription item was successfully updated." }
        format.json { render :show, status: :ok, location: @prescription_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prescription_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescription_items/1 or /prescription_items/1.json
  def destroy
    @prescription_item.destroy
    respond_to do |format|
      format.html { redirect_to prescription_items_url, notice: "Prescription item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription_item
      @prescription_item = PrescriptionItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prescription_item_params
      params.require(:prescription_item).permit(:uid, :prescription_id, :medicament, :posologie, :comment, :status, :user_id)
    end
end
