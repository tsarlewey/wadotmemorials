class MapEntriesController < ApplicationController
  def index
    @map_entries = MapEntry.all
    respond_to do |format|
      format.html
      format.json { render json: @map_entries.to_json }
    end
  end

  def new
    @map_entry = MapEntry.new
  end

  def create
    @map_entry = MapEntry.new(map_entry_params)
    if @map_entry.save
      redirect_to root_path, notice: "Entry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def map_entry_params
    params.require(:map_entry).permit(:title, :description, :latitude, :longitude)
  end
end
