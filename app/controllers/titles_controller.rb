class TitlesController < ApplicationController

  def index
    @title = Title.new
  end

  def create
    @title = Title.new(title_params)
    if @title.save
      redirect_to title_sentences_path(@title)
    else
      redirect_to root_path, notice: '!ジャンルとタイトルを入力してください'
    end
  end

  def show
    @title = Title.find(params[:id])
    @sentences = @title.sentences
  end

  private
    def title_params
      params.require(:title).permit(:name, :genre_id).merge(user_id: current_user.id)
    end
end
