class StatusController < ApplicationController
  def health
    render "OK"
  end
end