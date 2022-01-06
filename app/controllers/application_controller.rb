class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/games/:id' do
    game = Game.find(params[:id])

    # include associated reviews in the JSON response
    game.to_json(include: :reviews)
  end

    delete '/reviews/:id' do
   
      review = Review.find(params[:id])
      review.destroy
      review.to_json
    end

    post '/reviews' do
      post '/reviews' do
        review = Review.create(
          score: params[:score],
          comment: params[:comment],
          game_id: params[:game_id],
          user_id: params[:user_id]
        )
        review.to_json
      end

      patch '/reviews/:id' do
        review = Review.find(params[:id])
        review.update(
          score: params[:score],
          comment: params[:comment]
        )
        review.to_json
      end
    end

end
