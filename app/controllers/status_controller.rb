class StatusController < ApplicationController
  def health
    render json: { status: :ok }
  end
end