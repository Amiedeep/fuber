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

  def end_ride
    @location = Location.new(location_params)
    @location.save
    @taxi = Taxis::Taxi.where(taxi_params).first
    @taxi.update_attributes({available: true, location_id: @location.id})

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  private
  def type_param
    params.permit(:type)
  end

  def taxi_params
    params.permit(:id)
  end

  def location_params
    params.require(:location).permit(:lattitude, :longitude)
  end
end
