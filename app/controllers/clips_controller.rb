class ClipsController < ApplicationController
  def index
  end

  def new
    @clip = Clip.new
  end

  def create
    clip = current_user.clips.create(clip_params)
    redirect_to new_clip_path
  end

  def show
    @clip = Clip.find(params[:id])
    @clips = Clip.where(user_id: @clip.user).order("created_at DESC").limit(12)
  end

  def destroy
    clip = Clip.find(params[:id])
    clip.destroy
    redirect_to new_clip_path
  end

  private

  def clip_params
    params.required(:clip).permit(:image)
  end

end
