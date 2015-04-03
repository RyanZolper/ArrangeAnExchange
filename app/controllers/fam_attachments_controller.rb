class FamAttachmentsController < ApplicationController
  before_action :set_fam_attachment, only: [:show, :edit, :update, :destroy]

  # GET /fam_attachments
  # GET /fam_attachments.json
  def index
    @fam_attachments = FamAttachment.all
  end

  # GET /fam_attachments/1
  # GET /fam_attachments/1.json
  def show
  end

  # GET /fam_attachments/new
  def new
    @fam_attachment = FamAttachment.new
  end

  # GET /fam_attachments/1/edit
  def edit
  end

  # POST /fam_attachments
  # POST /fam_attachments.json
  def create
    @fam_attachment = FamAttachment.new(fam_attachment_params)

    respond_to do |format|
      if @fam_attachment.save
        format.html { redirect_to @fam_attachment, notice: 'Fam attachment was successfully created.' }
        format.json { render :show, status: :created, location: @fam_attachment }
      else
        format.html { render :new }
        format.json { render json: @fam_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fam_attachments/1
  # PATCH/PUT /fam_attachments/1.json
  def update
    respond_to do |format|
      if @fam_attachment.update(fam_attachment_params)
        format.html { redirect_to @fam_attachment, notice: 'Fam attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @fam_attachment }
      else
        format.html { render :edit }
        format.json { render json: @fam_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fam_attachments/1
  # DELETE /fam_attachments/1.json
  def destroy
    @fam_attachment.destroy
    respond_to do |format|
      format.html { redirect_to fam_attachments_url, notice: 'Fam attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fam_attachment
      @fam_attachment = FamAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fam_attachment_params
      params.require(:fam_attachment).permit(:family_id, :image)
    end
end
