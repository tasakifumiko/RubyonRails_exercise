class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  

  def create
    list = List.new(list_params)
    list.save
    redirect_to list_path(list.id)
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
