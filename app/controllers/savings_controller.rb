class SavingsController < ApplicationController
  before_action :set_saving, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /savings or /savings.json
  def index
    @total_savings_by_user = Saving.total_savings_by_user
  end

  # GET /savings/1 or /savings/1.json
  def show; end

  # GET /savings/new
  def new
    @saving = Saving.new
  end

  # GET /savings/1/edit
  def edit; end

  # POST /savings or /savings.json
  def create
    @saving = Saving.new(saving_params.merge({ user: current_user }))

    respond_to do |format|
      if @saving.save
        format.html { redirect_to root_url, notice: t('savings.flash.create.success') }
        format.json { render :show, status: :created, location: @saving }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /savings/1 or /savings/1.json
  def update
    respond_to do |format|
      if @saving.update(saving_params)
        format.html { redirect_to root_url, notice: t('savings.flash.update.success') }
        format.json { render :show, status: :ok, location: @saving }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /savings/1 or /savings/1.json
  def destroy
    @saving.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: t('savings.flash.destroy.success') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_saving
    @saving = Saving.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def saving_params
    params.require(:saving).permit(:label, :money, :category_id)
  end
end
