class RoomsController < ApplicationController
  before_action :default_image, only:[:create]
  def index
    @user = User.find(params[:id])
    @rooms = @user.rooms
  end
  def show
    @rooms = Room.find(params[:id])
  end
  def new
    @room = Room.new
  end
  def create
    @user = User.new(user_params)
    @room = @user.rooms.build(room_params)
    if @room.save
      flash[:success] = "新規のルームを登録しました。"
      render 'show'
    else
      render @room
    end
  end
  def edit
    @room = Room.find(params[:room_id])
  end
  def update
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
