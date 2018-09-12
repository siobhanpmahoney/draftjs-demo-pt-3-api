class Api::V1::NotesController < ApplicationController

  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    @note = Note.new(note_params)
    if @note.title != "" && @note.content != "{\'blocks\':[{\'key\':\'fjjpi\',\'text\':\'\',\'type\':\'unstyled\',\'depth\':0,\'inlineStyleRanges\':[],\'entityRanges\':[],\'data\':{}}],\'entityMap\':{}}"
      begin
        @note = Note.create(title: params[:title], content: params[:content])
        render json: @note, status: 201
      rescue NoteError => e
        render json: {error: "Can't be blank"}, status: 401
      end
    else
      render json: { error: "Need all info correct to sign up" }
    end


    #
    # note = Note.create(title: params[:title], content: params[:content])
    # render json: @note, status: 201
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
