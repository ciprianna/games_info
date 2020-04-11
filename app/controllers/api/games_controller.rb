# frozen_string_literal: true

class Api::GamesController < ApiController
  def index
    render json: Game.all
  end
end
