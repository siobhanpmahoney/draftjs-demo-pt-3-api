class Api::V1::NotesController < ApplicationController

  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    @note = Note.create(title: params[:title], content: params[:content])
    render json: @note, status: 201
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(title: params[:title], content: params[:content])
    @note.save
    render json: @note
  end

  def show
    @note = Note.find(params[:id])
    render json: @note, status: 200
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: {message:"Note Deleted"}
  end

  private

  def note_params
    params.require(:note_params).permit(:title, :content)
  end

end
