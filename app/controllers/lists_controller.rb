class ListsController < ApplicationController
  before_action :set_user
  before_action :set_user_list, only: [:show, :update, :destroy]

  # GET /users/:user_id/lists
  def index
    json_response(@user.lists)
  end

  # GET /users/:user_id/lists/:id
  def show
    json_response(@list)
  end

  # POST /users/:user_id/lists
  def create
    @user.lists.create!(list_params)
    json_response(@user, :created)
  end

  # PUT /users/:user_id/lists/:id
  def update
    @list.update(list_params)
    head :no_content
  end

  # DELETE /users/:user_id/lists/:id
  def destroy
    @list.destroy
    head :no_content
  end

  private

  def list_params
    params.permit(:title, :body, :status)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_list
    @list = @user.lists.find_by!(id: params[:id]) if @user
  end
end
