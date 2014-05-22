class HotelsController < ApplicationController
  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hotels }
    end
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
    @hotel = Hotel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hotel }
    end
  end

  # GET /view/1
  # GET /view/1.json

  def view

	puts session.inspect	
    # you should get these dates from sessions
    from_date = DateTime.parse("2014/5/22").to_date.to_s
    to_date = DateTime.parse("2014/5/28").to_date.to_s
    #range = (from_date)..to_date

    session[:from_date] = "2014/5/22"
    session[:to_date] = "2014/5/28"

    @hotel = Hotel.find(params[:id])
    @hotel_pics = HotelPic.where(hotel_id:params[:id])
    rooms1 = Room.select("rooms.id,rooms.room_type,rooms.price,rooms.avatar,rooms.descs,(rooms.quantity - sum(booked_rooms.quantity)) as rooms_left").joins(:booked_rooms).where("rooms.hotel_id = ? and from_date between ? and ? OR to_date between ? and ?",params[:id],from_date,to_date,from_date,to_date)
    rooms2 = Room.where("hotel_id = ?",params[:id])
    @rooms = rooms1 | rooms2 
    @comments = User.select("comments.head,comments.body,comments.rating,users.email").joins(:comments).where("comments.hotel_id = ?",params[:id])
    @from_date = from_date
    @to_date = to_date

	respond_to do |format|
		
		format.html
	end
  end


  # GET /hotels/new
  # GET /hotels/new.json
  def new
    @hotel = Hotel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hotel }
    end
  end

  # GET /hotels/1/edit
  def edit
    @hotel = Hotel.find(params[:id])
  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render json: @hotel, status: :created, location: @hotel }
      else
        format.html { render action: "new" }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hotels/1
  # PUT /hotels/1.json
  def update
    @hotel = Hotel.find(params[:id])

    respond_to do |format|
      if @hotel.update_attributes(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy

    respond_to do |format|
      format.html { redirect_to hotels_url }
      format.json { head :no_content }
    end
  end


private

  def hotel_params
    params.require(:hotel).permit(:name,:city,:country,:avatar,:desc ,:rating)
  end

end
