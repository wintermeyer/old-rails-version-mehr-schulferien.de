class CountriesController < ApplicationController
  before_action :set_and_authorize_country, only: [:show, :edit, :update, :destroy]

  after_filter :verify_authorized,  except: :index
  after_filter :verify_policy_scoped, only: :index

  # GET /countries
  def index
    @countries = policy_scope(Country.all)
  end

  # GET /countries/1
  def show
  end

  # GET /countries/new
  def new
    @country = Country.new
    authorize @country, :new?
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  def create
    @country = Country.new(country_params)
    authorize @country, :create?

    if @country.save
      redirect_to @country, notice: 'Country was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /countries/1
  def update
    if @country.update(country_params)
      redirect_to @country, notice: 'Country was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /countries/1
  def destroy
    @country.destroy
    redirect_to countries_url, notice: 'Country was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_country
      @country = Country.friendly.find(params[:id])
      authorize @country, "#{action_name}?".to_sym
    end

    # Only allow a trusted parameter "white list" through.
    def country_params
      params.require(:country).permit(:name, :slug, :url_prefix)
    end
end
