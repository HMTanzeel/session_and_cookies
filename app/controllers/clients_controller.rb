require "prawn"
class ClientsController < ApplicationController
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf { render pdf: generate_pdf(@client) }
    end
  end
  # def create
  #   @client = Client.new(client_params)
  #   if @client.save
  #     # ...
  #   else
  #     flash.now[:error] = "Could not save client"
  #     render action: "new"
  #   end
  # end
  def download_pdf
    client = Client.find(params[:id])
    send_data generate_pdf(client),
              filename: "#{client.name}.pdf",
              type: "application/pdf"
    send_file("#{Rails.root}/files/clients/#{client.id}.pdf",
                filename: "#{client.name}.pdf",
                type: "application/pdf")
  end

  private
    def generate_pdf(client)
      Prawn::Document.new do
        text client.name, align: :center
        text "Address: #{client.address}"
        text "Email: #{client.email}"
      end.render
    end
end
