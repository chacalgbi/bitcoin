class MineracaosController < ApplicationController
  before_action :set_mineracao, only: %i[ show edit update destroy ]

  # GET /mineracaos or /mineracaos.json
  def index
    @mineracaos = Mineracao.all
  end

  # GET /mineracaos/1 or /mineracaos/1.json
  def show
  end

  # GET /mineracaos/new
  def new
    @mineracao = Mineracao.new
  end

  # GET /mineracaos/1/edit
  def edit
  end

  # POST /mineracaos or /mineracaos.json
  def create
    @mineracao = Mineracao.new(mineracao_params)

    respond_to do |format|
      if @mineracao.save
        format.html { redirect_to @mineracao, notice: "Mineracao was successfully created." }
        format.json { render :show, status: :created, location: @mineracao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mineracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mineracaos/1 or /mineracaos/1.json
  def update
    respond_to do |format|
      if @mineracao.update(mineracao_params)
        format.html { redirect_to @mineracao, notice: "Mineracao was successfully updated." }
        format.json { render :show, status: :ok, location: @mineracao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mineracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mineracaos/1 or /mineracaos/1.json
  def destroy
    @mineracao.destroy
    respond_to do |format|
      format.html { redirect_to mineracaos_url, notice: "Mineracao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mineracao
      @mineracao = Mineracao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mineracao_params
      params.require(:mineracao).permit(:nome, :acronimo)
    end
end
