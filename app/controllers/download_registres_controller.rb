class DownloadRegistresController < ApplicationController

	def show
    respond_to do |format|
      format.pdf { send_edifici_pdf_registre }
    end
  end

  private

  def registre_pdf
    edifici = Edifici.find(params[:edifici_id])
    RegistrePdf.new(edifici)
  end

  def send_edifici_pdf_registre
    send_file registre_pdf.to_pdf,
      filename: registre_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end

end
