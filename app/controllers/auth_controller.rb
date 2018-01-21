class AuthController < ApplicationController
  def create
    
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      token = JWT.encode({user_id: user.id}, ENV['JWT_SECRET'], ENV['JWT_ALGO'])
      render json: {
        user_id: user.id,
        token: token
      }
    else
      render json: {error: 'No account or password found'}
    end

  end

  def show
    user_id = JWT.decode(params[:token], ENV["JWT_SECRET"])[0]["user_id"]
    user = User.find_by(id: user_id)
    render json: {
      user_id: user.id,
      token: params[:token]
    }

  end

end
