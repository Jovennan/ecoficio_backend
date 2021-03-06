class PapelsController < ApplicationController
  before_action :set_papel, only: [:show, :edit, :update, :destroy]
  before_action :load_permissaos, only: [:new, :create, :edit, :update]
  before_action :papel_or_not_found, only: [:edit, :update, :destroy]

  # GET /papels
  # GET /papels.json
  def index
    @papels = Papel.all
  end

  # GET /papels/1
  # GET /papels/1.json
  def show
  end

  # GET /papels/new
  def new
    @papel = Papel.new
  end

  # GET /papels/1/edit
  def edit
  end

  # POST /papels
  # POST /papels.json
  def create
    @papel = Papel.new(papel_params)

    respond_to do |format|
      if @papel.save
        format.html { redirect_to @papel, notice: 'Papel was successfully created.' }
        format.json { render :show, status: :created, location: @papel }
      else
        format.html { render :new }
        format.json { render json: @papel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papels/1
  # PATCH/PUT /papels/1.json
  def update
    respond_to do |format|
      if @papel.update(papel_params)
        format.html { redirect_to @papel, notice: 'Papel was successfully updated.' }
        format.json { render :show, status: :ok, location: @papel }
      else
        format.html { render :edit }
        format.json { render json: @papel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papels/1
  # DELETE /papels/1.json
  def destroy
    @papel.destroy
    respond_to do |format|
      format.html { redirect_to papels_url, notice: 'Papel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_papel
      @papel = Papel.find(params[:id])
    end

    def load_permissaos
      @permissaos = generate_permissaos
    end

    def papel_or_not_found
      @papel = Papel.find_by(id: params[:id])
      if @papel.nil?
        flash['notice'] = 'Papel não encontrado.'
        redirect_to papels_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def papel_params
      papel_params = params.require(:papel).permit(:nome, :descricao, permissao_ids: [])
      papel_params[:permissao_ids] = papel_params[:permissao_ids].concat(permissao_ids_for_papels(params[:papels]))
      papel_params
    end
end
