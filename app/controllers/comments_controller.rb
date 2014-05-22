class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  #POST /comments/add/1
  #POST /comments/add/1.json
  
  def add

    comment_param = { hotel_id:params[:id] ,head:params[:head] ,rating:params[:rating].to_f ,body:params[:body] ,user_id:session['warden.user.user.key'][0][0].to_f }

    comment = Comment.new(comment_param)    

    hotel = Hotel.find(params[:id])
    
    #recalculating average rating

    hotel_rating = (hotel.rating + params[:rating].to_f) / (hotel.votes + 1)

    section = { rating:hotel_rating , votes:(hotel.votes + 1) }

    if hotel.update_attributes(section)


    	      if comment.save
  
			respond_to do |format|

				format.html { redirect_to  :controller => 'hotels', :action => 'view' , :id => params[:id] }
			end
		

		end

	else

		respond_to do |format|

			format.html { render :status => 500 }
		end

    end

  end

	private

  def comment_params
    params.require(:comment).permit!
  end


end
