class PhoneNumbersController < ApplicationController
  before_action :set_and_authorize_phone_number, only: [:show, :edit, :update, :destroy]

  after_filter :verify_authorized,  except: :index
  after_filter :verify_policy_scoped, only: :index

  def index
    @phone_numbers = policy_scope(PhoneNumber.all)
    fresh_when etag: [I18n.locale, current_user, cache_key_for_all(PhoneNumber)]
  end

  def show
    fresh_when etag: [I18n.locale, current_user, @phone_number]
  end

  def new
    @phone_number = PhoneNumber.new
    authorize @phone_number, :new?
  end

  def edit
  end

  def create
    @phone_number = PhoneNumber.new(phone_number_params)
    authorize @phone_number, :create?

    if @phone_number.save
      redirect_to @phone_number, notice: 'Phone number was successfully created.'
    else
      render :new
    end
  end

  def update
    if @phone_number.update(phone_number_params)
      redirect_to @phone_number, notice: 'Phone number was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @phone_number.destroy
    redirect_to phone_numbers_url, notice: 'Phone number was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_phone_number
      @phone_number = PhoneNumber.find(params[:id])
      authorize @phone_number, "#{action_name}?".to_sym
    end

    # Only allow a trusted parameter "white list" through.
    def phone_number_params
      params.require(:phone_number).permit(:name, :value, :phone_numberable_id, :phone_numberable_type)
    end
end
