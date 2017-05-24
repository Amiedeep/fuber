class TaxisController < ApplicationController
  def get_nearest
    @location = Location.new(location_params)
    @location.save
    @taxi_type = type_param.dig(:type).constantize if type_param

    @taxi = Taxis::Taxi.get_nearest @location, @taxi_type

    if @taxi
      @taxi.update_attributes({available: false})
      render json: @taxi
    else
      render json: {error: "no taxi available"}
    end
  end

  private
  def type_param
    params.permit(:type)
  end

  def location_params
    params.require(:location).permit(:lattitude, :longitude)
  end
end
