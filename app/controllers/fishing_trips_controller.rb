class FishingTripsController < ApplicationController
    
    
    def index
        # @変数名 ⇦ インスタンス変数：ビューなどの他の場所でも利用することが出来る
        # @変数名 = {} ⇦ 空のハッシュで初期化、ハッシュはキーと値のペアを格納するためのデータ構造
        @fishing_trips = FishingTrip.all #FishingTripモデルの全てのレコードをDBから取得
        @other_trips = FishingTrip.all #FishingTripモデルの全てのレコードをDBから取得
        @is_organizer = {} #募集の主催者が現在のユーザーかどうかの真偽値を保持

        @user_participation_status = {}
        @each_all_participations = {} #各募集に対する全参加申請
        @current_user_participations = {} #現在のユーザーの参加申請
        
        @fishing_trips.each do |trip|
           @is_organizer[trip.id] = trip.organizer == current_user
           @current_user_participations[trip.id] = trip.participations.where(user: current_user)
            if @is_organizer[trip.id] #もし主催者であれば、
                @each_all_participations[trip.id] = trip.participations #そのすべての参加情報を保存
            else #主催者でなければ
                participation = trip.participations.find_by(user: current_user) #そのユーザーに関連する参加情報を検索
                @user_participation_status[trip.id] = participation&.status #見つかった参加情報のステータスを取得
            end
        end
        # パラメータで都道府県が指定されていれば、それに基づいてフィルタリング
        if params[:location].present? #リクエストのパラメータに'location'キーが存在し、かつそれに値が設定されている(空ではない)場合にtrueを返す
            @other_trips = @other_trips.where(location: params[:location])#location 属性がリクエストの location パラメータと一致する FishingTrip レコードのみを選択する
        end
    end
    
    
    def new
        @fishing_trip = FishingTrip.new
    end
    
    
    def create
        @fishing_trip = FishingTrip.new(fishing_trip_params)
        @fishing_trip.organizer = current_user #現在ログインしているユーザーを設定
        if @fishing_trip.save
            @chat_room = ChatRoom.new(fishing_trip_id: @fishing_trip.id)
            if @chat_room.save
                redirect_to fishing_trips_path, notice: '募集とチャットルームが作成されました。'
            else
                redirect_to new_fishing_trip_path, alert: 'チャットルームの作成に失敗しました'
            end
        else
            render :new
        end
        
    end
    
    def destroy
        @fishing_trip = FishingTrip.find(params[:id])
        @fihsing_trip.destroy
        redirect_to fishing_trips_path, notice: '募集が削除されました'
    end
    
    private
        def fishing_trip_params
            params.require(:fishing_trip).permit(:organizer_id, :title, :description, :location, :start_date, :participant_limit)
        end
        
end
