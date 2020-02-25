class EarthquakesController < ApplicationController
  before_action :set_earthquake, only: [:show, :edit, :update, :destroy]
  # GET /earthquakes
  # GET /earthquakes.json
  def index                                    
    @earthquakes = Earthquake.order(:time).page(params[:page])
  end

  # GET /earthquakes/1
  # GET /earthquakes/1.json
  def show
  end

  # GET /earthquakes/new
  def new
    @earthquake = Earthquake.new
  end

  # GET /earthquakes/1/edit
  def edit
  end

=begin 
  def feed
    require 'rss'
    require 'open-uri'

    url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.atom'
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      puts "Title: #{"USGS Significant Earthquakes, Past Week"}"
      feed.items.each do |item|
        puts "Item: #{item.title}"
      end
    end
  end
=end


# Fetch a feed containing GeoRss info and print them


  # POST /earthquakes
  # POST /earthquakes.json
  def create
    @earthquake = Earthquake.new(earthquake_params)

    respond_to do |format|
      if @earthquake.save
        format.html { redirect_to @earthquake, notice: 'Earthquake was successfully created.' }
        format.json { render :show, status: :created, location: @earthquake }
      else
        format.html { render :new }
        format.json { render json: @earthquake.errors, status: :unprocessable_entity }
      end
    end
  end
  #2455
  # PATCH/PUT /earthquakes/1
  # PATCH/PUT /earthquakes/1.json
  def update
    respond_to do |format|
      if @earthquake.update(earthquake_params)
        format.html { redirect_to @earthquake, notice: 'Earthquake was successfully updated.' }
        format.json { render :show, status: :ok, location: @earthquake }
      else
        format.html { render :edit }
        format.json { render json: @earthquake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /earthquakes/1
  # DELETE /earthquakes/1.json
  def destroy
    @earthquake.destroy
    respond_to do |format|
      format.html { redirect_to earthquakes_url, notice: 'Earthquake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    
    def set_earthquake
      @earthquake = Earthquake.find(params[:id])
    end

   
    def earthquake_params
      params.require(:earthquake).permit(:locationSource, :latitude, :longitude)
    end
end



