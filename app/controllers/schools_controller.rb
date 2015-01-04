class SchoolsController < ApplicationController
  before_action :set_and_authorize_school, only: [:show, :edit, :update, :destroy]

  after_filter :verify_authorized,  except: :index
  after_filter :verify_policy_scoped, only: :index

  def index
    @schools = policy_scope(School.all)
    fresh_when etag: [I18n.locale, current_user, cache_key_for_all(School)]
  end

  def show
    fresh_when etag: [I18n.locale, current_user, @school]
  end

  def new
    @school = School.new
    authorize @school, :new?
  end

  def edit
  end

  def create
    @school = School.new(school_params)
    authorize @school, :create?

    if @school.save
      redirect_to @school, notice: 'School was successfully created.'
    else
      render :new
    end
  end

  def update
    if @school.update(school_params)
      redirect_to @school, notice: 'School was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to schools_url, notice: 'School was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_school
      @school = School.friendly.find(params[:id])
      authorize @school, "#{action_name}?".to_sym
    end

    # Only allow a trusted parameter "white list" through.
    def school_params
      params.require(:school).permit(:name, :address_line1, :address_line2, :street, :zip_code, :address_city_name, :email_address, :homepage_url, :city_id)
    end
end
