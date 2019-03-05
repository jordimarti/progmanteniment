class DownloadResumsController < ApplicationController

	def show
    respond_to do |format|
      format.pdf { send_edifici_pdf_resum }
    end
  end

  private

  def resum_pdf
    edifici = Edifici.find(params[:edifici_id])
    ResumPdf.new(edifici)
  end

  def send_edifici_pdf_resum
    send_file resum_pdf.to_pdf,
      filename: resum_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end

end
