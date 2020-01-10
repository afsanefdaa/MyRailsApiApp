class ShelvesController < ApplicationController
  before_action :set_shelf, only: [:show, :update, :destroy]

  def index
    @shelves = Shelf.all
    json_response(@shelves)
  end

  def create
    @shelf = Shelf.create!(shelf_params)
    json_response(@shelf, :created)
  end

  def show
    json_response(@shelf)
  end

  def update
    @shelf.update(shelf_params)
    head :no_content
  end

  def destroy
    @shelf.destroy
    head :no_content
  end

  private

  def shelf_params
    params.permit(:title, :created_by)
  end

  def set_shelf
    @shelf = Shelf.find(params[:id])
  end

end
