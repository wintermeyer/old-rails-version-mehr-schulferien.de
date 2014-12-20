class HolidaysController < ApplicationController
  before_action :set_and_authorize_holiday, only: [:show, :edit, :update, :destroy]

  after_filter :verify_authorized,  except: :index
  after_filter :verify_policy_scoped, only: :index

  def index
    @holidays = policy_scope(Holiday.all)
    fresh_when etag: [I18n.locale, current_user, cache_key_for_all(Holiday)]
  end

  def show
    fresh_when etag: [I18n.locale, current_user, @holiday]
  end

  def new
    @holiday = Holiday.new
    authorize @holiday, :new?
  end

  def edit
  end

  def create
    @holiday = Holiday.new(holiday_params)
    authorize @holiday, :create?

    if @holiday.save
      redirect_to @holiday, notice: 'Holiday was successfully created.'
    else
      render :new
    end
  end

  def update
    if @holiday.update(holiday_params)
      redirect_to @holiday, notice: 'Holiday was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @holiday.destroy
    redirect_to holidays_url, notice: 'Holiday was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_holiday
      @holiday = Holiday.friendly.find(params[:id])
      authorize @holiday, "#{action_name}?".to_sym
    end

    # Only allow a trusted parameter "white list" through.
    def holiday_params
      params.require(:holiday).permit(:name)
    end
end
