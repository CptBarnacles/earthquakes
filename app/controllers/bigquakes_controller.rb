class BigquakesController < ApplicationController
  before_action :set_bigquake, only: [:show, :edit, :update, :destroy]

  # GET /bigquakes
  # GET /bigquakes.json
  def index
    @bigquakes = Bigquake.order(:time).page(params[:page]).reorder('magError DESC')
  end

  # GET /bigquakes/1
  # GET /bigquakes/1.json
  def show
  end

  # GET /bigquakes/new
  def new
    @bigquake = Bigquake.new
  end

  # GET /bigquakes/1/edit
  def edit
  end

  # POST /bigquakes
  # POST /bigquakes.json
  def create
    @bigquake = Bigquake.new(bigquake_params)

    respond_to do |format|
      if @bigquake.save
        format.html { redirect_to @bigquake, notice: 'Bigquake was successfully created.' }
        format.json { render :show, status: :created, location: @bigquake }
      else
        format.html { render :new }
        format.json { render json: @bigquake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bigquakes/1
  # PATCH/PUT /bigquakes/1.json
  def update
    respond_to do |format|
      if @bigquake.update(bigquake_params)
        format.html { redirect_to @bigquake, notice: 'Bigquake was successfully updated.' }
        format.json { render :show, status: :ok, location: @bigquake }
      else
        format.html { render :edit }
        format.json { render json: @bigquake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bigquakes/1
  # DELETE /bigquakes/1.json
  def destroy
    @bigquake.destroy
    respond_to do |format|
      format.html { redirect_to bigquakes_url, notice: 'Bigquake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bigquake
      @bigquake = Bigquake.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bigquake_params
      params.require(:bigquake).permit(:locationSource, :latitude, :longitude, :magError)
    end
end
