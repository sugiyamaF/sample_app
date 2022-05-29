class ListsController < ApplicationController
  def new
    @lists = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(lists_params)
    redirect_to list_path(list.id)
  end

  private

  def list_params
    params.require(:list).params.permit(:title, :body)
  end
end
