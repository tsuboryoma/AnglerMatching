class ParticipationsController < ApplicationController
  def create
    participation = Participation.new(user: current_user, fishing_trip_id: params[:fishing_trip_id])
    if participation.save
      redirect_to fishing_trips_path(participation.fishing_trip), notice: '参加申請が完了しました。'
    else
      redirect_to fishing_trips_path, alert: '申請に失敗しました。'
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
