class GenresController < ApplicationController

  def show
    @titles = Genre.find(params[:id]).titles
  end
end

