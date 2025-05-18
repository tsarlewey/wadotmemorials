class MapsController < ApplicationController
  def index
    @map_entries = MapEntry.all
    respond_to do |format|
      format.html
      format.json { render json: @map_entries.to_json }
    end
  end
end
