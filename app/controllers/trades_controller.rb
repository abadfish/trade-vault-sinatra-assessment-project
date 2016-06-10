require 'rack-flash'
class TradesController < ApplicationController
  use Rack::Flash

  get '/trades' do
    if is_logged_in?
      @trades = Trade.all
      erb :'/trades/trades'
    else
      redirect '/login'
    end
  end

  post '/trades' do
    if is_logged_in?
      @trade = Trade.create(params)
      @trade.direction = params[:direction].downcase
      @trade.user_id = current_user.id
      @trade.save
      redirect "/trades/#{@trade.id}"
    else
      redirect '/login'
    end
  end

  get '/trades/new' do
    if is_logged_in?
      erb :'/trades/create_trade'
    else
      redirect '/login'
    end
  end

  get '/trades/:id' do
    @trade = Trade.find(params[:id])
    if is_logged_in?
      erb :'/trades/show_trade'
    else
      redirect '/login'
    end
  end

  get '/trades/:id/edit' do
    if is_logged_in?
      @trade = Trade.find(params[:id])
      if session[:user_id] == @trade.user_id
        erb :'/trades/edit_trade'
      else
        flash[:message] = "Not your trade, bro."

        redirect "/trades"
      end
    else
      redirect '/login'
    end
  end

  patch '/trades/:id' do
    if params[:product] != ""
      @trade = Trade.find_by_id(params[:id])
      @trade.direction = params[:direction].downcase
      @trade.size = params[:size]
      @trade.product = params[:product]
      @trade.trade_date = params[:trade_date]
      @trade.price = params[:price]
      @trade.save
      redirect "/trades/#{@trade.id}"
    else
      redirect "/trades/#{params[:id]}/edit"
    end
  end

  delete '/trades/:id/delete' do
    @trade = Trade.find_by_id(params[:id])
    if session[:user_id] == @trade.user_id
      @trade.delete
      redirect '/trades'
    else
      redirect '/trades'
    end
  end

  get '/users/:id/trades' do
    @user = User.find(params[:id])
    @trades = @user.trades
    erb :'/trades/show_users_trades'
  end

end
