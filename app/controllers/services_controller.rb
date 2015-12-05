require 'open-uri'

class ServicesController < ApplicationController
  def index
    @services = Service.all
 
   
  
  end

  def show
    @service = Service.find(params[:id])
    url_safe_street_address = URI.encode(@service.address)
    url = "http://maps.googleapis.com/maps/api/geocode/json?address="+url_safe_street_address
    parsed_data = JSON.parse(open(url).read)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new
    @service.image = params[:image]
    @service.category = params[:category]
    @service.name = params[:name]
    @service.address = params[:address]
    @service.phone = params[:phone]
    @service.description = params[:description]
    @service.avg_rating = params[:avg_rating]

    if @service.save
      redirect_to "/services", :notice => "Service created successfully."
    else
      render 'new'
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])

    @service.image = params[:image]
    @service.category = params[:category]
    @service.name = params[:name]
    @service.address = params[:address]
    @service.phone = params[:phone]
    @service.description = params[:description]
    @service.avg_rating = params[:avg_rating]

    if @service.save
      redirect_to "/services", :notice => "Service updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @service = Service.find(params[:id])

    @service.destroy

    redirect_to "/services", :notice => "Service deleted."
  end
end
