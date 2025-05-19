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

  def destroy
    @map_entry = MapEntry.find(params[:id])
    @map_entry.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Entry was successfully deleted." }
      format.json { render json: { success: true }, status: :ok }
    end
  end


  private

  def map_entry_params
    params.require(:map_entry).permit(:title, :description, :latitude, :longitude)
  end
end
