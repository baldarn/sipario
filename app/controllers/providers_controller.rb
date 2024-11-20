class ProvidersController < BaseUserController
  def index
    @providers = Provider.page(params[:page])
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def search
    lon = params[:lon]
    lat = params[:lat]
    radius = params[:radius] ||= 200 # meters

    if lon.blank? && lat.blank?
      return render json: { error: "missing lat lon" }
    end

    @providers = Provider.where(
      "ST_DWithin(
        lonlat::geography,
        ST_SetSRID(ST_MakePoint(?, ?), 4326)::geography,
        ?
      )",
      lon,
      lat,
      radius
    )
  end
end
