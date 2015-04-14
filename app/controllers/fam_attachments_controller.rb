class FamAttachmentsController < ApplicationController

  def create
    @fam_attachment = FamAttachment.new(fam_attachment_params)
  end



  private

    def fam_attachment_params
      params.require(:fam_attachment).permit(:family_id, :image)
    end
    
end
