class NonprofitsController < ApplicationController
  def show
    @nonprofit = Nonprofit.find(params[:id])
  end

  def index
    @nonprofits = Nonprofit.all
  end
end
