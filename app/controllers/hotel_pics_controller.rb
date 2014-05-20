class HotelPicsController < ApplicationController
  # GET /hotel_pics
  # GET /hotel_pics.json
  def index
    @hotel_pics = HotelPic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hotel_pics }
    end
  end

  # GET /hotel_pics/1
  # GET /hotel_pics/1.json
  def show
    @hotel_pic = HotelPic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hotel_pic }
    end
  end

  # GET /hotel_pics/new
  # GET /hotel_pics/new.json
  def new
    @hotel_pic = HotelPic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hotel_pic }
    end
  end

  # GET /hotel_pics/1/edit
  def edit
    @hotel_pic = HotelPic.find(params[:id])
  end

  # POST /hotel_pics
  # POST /hotel_pics.json
  def create
    @hotel_pic = HotelPic.new(params[:hotel_pic])

    respond_to do |format|
      if @hotel_pic.save
        format.html { redirect_to @hotel_pic, notice: 'Hotel pic was successfully created.' }
        format.json { render json: @hotel_pic, status: :created, location: @hotel_pic }
      else
        format.html { render action: "new" }
        format.json { render json: @hotel_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hotel_pics/1
  # PUT /hotel_pics/1.json
  def update
    @hotel_pic = HotelPic.find(params[:id])

    respond_to do |format|
      if @hotel_pic.update_attributes(params[:hotel_pic])
        format.html { redirect_to @hotel_pic, notice: 'Hotel pic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hotel_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotel_pics/1
  # DELETE /hotel_pics/1.json
  def destroy
    @hotel_pic = HotelPic.find(params[:id])
    @hotel_pic.destroy

    respond_to do |format|
      format.html { redirect_to hotel_pics_url }
      format.json { head :no_content }
    end
  end
end
