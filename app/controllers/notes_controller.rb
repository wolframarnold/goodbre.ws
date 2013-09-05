class NotesController < ApplicationController
  before_filter :ensure_signed_in!, :load_beer

  def edit
    render partial: 'form'
  end

  def create
    @note.text = params[:note][:text]
    if @note.save
      render json: {note: @note}, status: 200
    else
      render partial: 'form', status: :unprocessable_entity
    end
  end
  alias_method :update, :create

  private

  def load_beer
    @beer = Beer.find params[:beer_id]
    @note = current_user.notes.find_or_initialize_by_beer_id(params[:beer_id])
  end

end