class SentencesController < ApplicationController
  before_action :set_title 

  def index
    @sentence = Sentence.new
  end

  def new
    @sentence = Sentence.new
    @before_sentence = Sentence.order(created_at: :desc).find_by(title_id: @title.id)
  end

  def create
    @sentence = Sentence.new(sentence_params)
    if @sentence.save
      redirect_to new_title_sentence_path(@title)
    else
      redirect_to new_title_sentence_path(@title), alert: '!文章を入力してください'
    end
  end

  def show
    
  end

  private
    def sentence_params
      params.require(:sentence).permit(:sentence).merge(title_id: params[:title_id])
    end

    def set_title
      @title = Title.find(params[:title_id])
    end
end
