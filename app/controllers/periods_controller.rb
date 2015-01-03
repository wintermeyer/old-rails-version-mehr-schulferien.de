class PeriodsController < ApplicationController
  before_action :set_and_authorize_period, only: [:show, :edit, :update, :destroy]

  after_filter :verify_authorized,  except: :index
  after_filter :verify_policy_scoped, only: :index

  def index
    @periods = policy_scope(Period.all)
    fresh_when etag: [I18n.locale, current_user, cache_key_for_all(Period)]
  end

  def show
    fresh_when etag: [I18n.locale, current_user, @period]
  end

  def new
    @period = Period.new
    authorize @period, :new?
  end

  def edit
  end

  def create
    @period = Period.new(period_params)
    authorize @period, :create?

    if @period.save
      redirect_to @period, notice: 'Period was successfully created.'
    else
      render :new
    end
  end

  def update
    if @period.update(period_params)
      redirect_to @period, notice: 'Period was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @period.destroy
    redirect_to periods_url, notice: 'Period was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_period
      @period = Period.find(params[:id])
      authorize @period, "#{action_name}?".to_sym
    end

    # Only allow a trusted parameter "white list" through.
    def period_params
      params.require(:period).permit(:first_day, :last_day, :holiday_id, :periodable_id, :periodable_type)
    end
end
