class ClientsController < ApplicationController
  def create
    @client = Client.new(client_params)
    if @client.save
      # ...
    else
      flash.now[:error] = "Could not save client"
      render action: "new"
    end
  end
end
