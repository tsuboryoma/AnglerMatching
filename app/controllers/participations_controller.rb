class ParticipationsController < ApplicationController
  def create
    participation = Participation.find_by(user: current_user, fishing_trip_id: params[:fishing_trip_id])

    if participation
      # 既存の参加申請がある場合、ステータスを 'pending' に更新
      if participation.update(status: 'pending')
        redirect_to fishing_trips_path, notice: '再度の参加申請が完了しました。'
      else
        redirect_to fishing_trips_path, alert: '参加申請の更新に失敗しました。'
      end
    else
      # 既存の参加申請がない場合、新しい参加申請を作成
      new_participation = Participation.new(user: current_user, fishing_trip_id: params[:fishing_trip_id])
      if new_participation.save
        redirect_to fishing_trips_path, notice: '参加申請が完了しました。'
      else
        redirect_to fishing_trips_path, alert: '新しい参加申請に失敗しました。'
      end
    end
  end

  def update
    participation = Participation.find(params[:id])
    if participation.update(status: params[:status])
      redirect_to fishing_trips_path(participation.fishing_trip), notice: 'ステータスが更新されました。'
    else
      redirect_to fishing_trips_path(participation.fishing_trip), alert: 'ステータスの更新に失敗しました。'
    end
  end
end
