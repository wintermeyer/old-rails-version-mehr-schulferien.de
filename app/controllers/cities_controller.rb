class CitiesController < ApplicationController
  before_action :set_and_authorize_city, only: [:show, :edit, :update, :destroy]

  after_filter :verify_authorized,  except: :index
  after_filter :verify_policy_scoped, only: :index

  def index
    @cities = policy_scope(City.all)
    fresh_when etag: [I18n.locale, current_user, cache_key_for_all(City)]
  end

  def show
    fresh_when etag: [I18n.locale, current_user, @city]
  end

  def new
    @city = City.new
    authorize @city, :new?
  end

  def edit
  end

  def create
    @city = City.new(city_params)
    authorize @city, :create?

    if @city.save
      redirect_to @city, notice: 'City was successfully created.'
    else
      render :new
    end
  end

  def update
    if @city.update(city_params)
      redirect_to @city, notice: 'City was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_url, notice: 'City was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_city
      @city = City.friendly.find(params[:id])
      authorize @city, "#{action_name}?".to_sym
    end

    # Only allow a trusted parameter "white list" through.
    def city_params
      params.require(:city).permit(:name, :zip_code, :federal_state_id)
    end
end
