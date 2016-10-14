class Api::V1::UsersController < Api::V1::BaseController
 respond_to :json


  def show
 respond_with User.find(params[:id])
  end

def index
    users = User.all

    render(
      json: ActiveModel::ArraySerializer.new(
        users,
        each_serializer: Api::V1::UserSerializer,
        root: 'users',
      )
    )
  end

  
end