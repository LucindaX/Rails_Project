class BookedRoomsController < ApplicationController
  # GET /booked_rooms
  # GET /booked_rooms.json
  def index
    @booked_rooms = BookedRoom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @booked_rooms }
    end
  end

  # GET /booked_rooms/1
  # GET /booked_rooms/1.json
  def show
    @booked_room = BookedRoom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booked_room }
    end
  end

  # GET /booked_rooms/new
  # GET /booked_rooms/new.json
  def new
    @booked_room = BookedRoom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @booked_room }
    end
  end

  # GET /booked_rooms/1/edit
  def edit
    @booked_room = BookedRoom.find(params[:id])
  end

  # POST /booked_rooms
  # POST /booked_rooms.json
  def create
    @booked_room = BookedRoom.new(booked_room_params)

    respond_to do |format|
      if @booked_room.save
        format.html { redirect_to @booked_room, notice: 'Booked room was successfully created.' }
        format.json { render json: @booked_room, status: :created, location: @booked_room }
      else
        format.html { render action: "new" }
        format.json { render json: @booked_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /booked_rooms/1
  # PUT /booked_rooms/1.json
  def update
    @booked_room = BookedRoom.find(params[:id])

    respond_to do |format|
      if @booked_room.update_attributes(booked_room_params)
        format.html { redirect_to @booked_room, notice: 'Booked room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @booked_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booked_rooms/1
  # DELETE /booked_rooms/1.json
  def destroy
    @booked_room = BookedRoom.find(params[:id])
    @booked_room.destroy

    respond_to do |format|
      format.html { redirect_to booked_rooms_url }
      format.json { head :no_content }
    end
  end


  # POST /booked_rooms/book/1
  def book
	
 
    if  session[:from_date] && session[:to_date]

	from_date = DateTime.parse(session[:from_date]).to_date.to_s
	to_date = DateTime.parse(session[:to_date]).to_date.to_s
    	puts "in loop"	
	params.each do |key, value| 
		puts key
	   # target groups using regular expressions
	      if ( (key =~ /[0-9]+\z/) == 0 )
		puts "i am herrreeeee"	
		room = { room_id:key.to_f , hotel_id:params[:id] , quantity:value.to_f , from_date:from_date , to_date:to_date }
		booking = BookedRoom.new(room)
		booking.save

              end
	
        end
     

    end
	
    respond_to do |format|
      
      format.html { redirect_to booked_rooms_url  }
      format.json { head :no_content }
    end
  end

	private
	
		def booked_room_params
	
			params.require(:booked_room).permit!
		end

end
