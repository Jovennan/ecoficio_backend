class DocumentosController < ApplicationController
  before_action :set_documento, only: [:show, :edit, :update, :destroy]

  # GET /documentos
  # GET /documentos.json
  def index
    @documentos = []
    if params[:orgao_id]
      @documentos = Documento.where(orgao_id: params[:orgao_id])
    else
      @documentos = Documento.all
    end
    puts @documentos.length
    @documentos
  end

  # GET /documentos/1
  # GET /documentos/1.json
  def show
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        # pdf = Prawn::Document.new
        pdf = DocumentosPdf.new(@documento)
        send_data pdf.render,
          filename: "oficio_#{Time.new}",
          type: 'application/pdf',
          disposition: 'inline'
      end
    end
  end

  # GET /documentos/new
  def new
    @documento = Documento.new
  end

  # GET /documentos/1/edit
  def edit
  end

  def get
    @documento = Documento.find_by(brasao: params[:brasao])
    respond_to do |format|
      if @documento
        format.pdf do
          # pdf = Prawn::Document.new
          pdf = DocumentosPdf.new(@documento)
          send_data pdf.render,
            filename: "oficio_#{Time.new}",
            type: 'application/pdf',
            disposition: 'inline'
        end
        format.html { redirect_to @documento }
        format.json { render :show, status: :success, location: @documento }
      else
        format.html { redirect_to "/" }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /documentos
  # POST /documentos.json
  def create
    @documento = Documento.new(documento_params)
    @documento.brasao = Digest::SHA512.hexdigest("#{@documento.titulo} - #{@documento.descricao}")
    respond_to do |format|
      if @documento.save
        format.html { redirect_to @documento, notice: 'Documento was successfully created.' }
        format.json { render :show, status: :created, location: @documento }
      else
        format.html { render :new }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentos/1
  # PATCH/PUT /documentos/1.json
  def update
    respond_to do |format|
      if @documento.update(documento_params)
        format.html { redirect_to @documento, notice: 'Documento was successfully updated.' }
        format.json { render :show, status: :ok, location: @documento }
      else
        format.html { render :edit }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.json
  def destroy
    @documento.destroy
    respond_to do |format|
      format.html { redirect_to documentos_url, notice: 'Documento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documento_params
      params.require(:documento).permit(:nome, :descricao, :titulo, :brasao, :autor_id, :orgao_id, :visibilidade)
    end
end
