class RoomsController < ApplicationController
  before_action :logged_in_user, only:[:index]

  def top
    @user = current_user
  end
  def new
    @user = current_user
    @room = Room.new
  end
  def create
    @user = current_user
    @room = @user.rooms.build(room_params)
    if @room.save
      flash[:success] = "新規のルームを登録しました。"
      redirect_to rooms_show_url(@room)
    else
      render @room
    end
  end
  def destroy
    @room = Room.find(params[:room_id])
    @room.destroy
    redirect_to rooms_search_url
  end
  def index
    @user = current_user
    @rooms = @user.rooms
  end
  def show
    @user = current_user
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end
  def search
    @user = current_user
    area = params[:area]
    keyword = params[:keyword]
    if !area.nil? && !keyword.nil?
      @rooms = Room.where("address like ? or facility_name like ? or introduction like ? ", "%#{area}%", "%#{keyword}%", "%#{keyword}%")
    elsif !area.nil? && keyword.nil?
      @rooms = Room.where("address like ?", "%#{area}%")
    elsif area.nil? && !keyword.nil?
      @rooms = Room.where("facility_name like ? or introduction like ? ", "%#{keyword}%", "%#{keyword}%")
    else
      @rooms = Room.all
    end
    render 'search'
  end
  def edit
    @user = current_user
    @room = Room.find(params[:room_id])
  end
  def update
    @user = current_user
    @room = Room.find(params[:room_id])
    if @room && @room.update(room_params)
      flash[:sucess].now = "ルームを更新しました。"
      redirect_to rooms_show_url(@room)
    else
      render rooms_edit(@room)
    end
  end
  def room_params
    params.require(:room).permit(:facility_name,:introduction, :prices, :address, :image)
  end
  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open('/app/assets/images'), filename: 'default_room.png', content_type: 'application/png')
    end
  end
end
