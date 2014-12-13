class FederalStatesController < ApplicationController
  before_action :set_federal_state, only: [:show, :edit, :update, :destroy]

  # GET /federal_states
  def index
    @federal_states = FederalState.all
  end

  # GET /federal_states/1
  def show
  end

  # GET /federal_states/new
  def new
    @federal_state = FederalState.new
  end

  # GET /federal_states/1/edit
  def edit
  end

  # POST /federal_states
  def create
    @federal_state = FederalState.new(federal_state_params)

    if @federal_state.save
      redirect_to @federal_state, notice: 'Federal state was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /federal_states/1
  def update
    if @federal_state.update(federal_state_params)
      redirect_to @federal_state, notice: 'Federal state was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /federal_states/1
  def destroy
    @federal_state.destroy
    redirect_to federal_states_url, notice: 'Federal state was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_federal_state
      @federal_state = FederalState.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def federal_state_params
      params.require(:federal_state).permit(:country_id, :name, :slug)
    end
end
