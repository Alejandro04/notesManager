class NotesController < ApplicationController
#  before_action :set_note, only: [:show, :update, :destroy]
 layout 'admin'
  # GET /notes
  def index
    if params[:category_id] != nil || params[:title] != nil || params[:date] != nil || params[:order] != nil
      if params[:category_id] != nil && params[:category_id] != ""
        @notes = Note.find_by_sql("Select * from NOTES WHERE category_id = #{params[:category_id]}")
        render json: @notes
      end
      if params[:order] != nil && params[:order] != ""
        @notes = Note.find_by_sql("Select * from NOTES ORDER BY created_at #{params[:order]}")
        render json: @notes
      end
      if params[:date] != nil && params[:date] != ""
        @notes = Note.find_by_sql("Select * from NOTES WHERE created_at = '#{params[:date]}'")
        render json: @notes
      end
      if params[:title] != nil && params[:title] != ""
        @notes = Note.find_by_sql("Select * from NOTES WHERE title = '#{params[:title]}'")
        render json: @notes
      end
    else
      @notes = Note.all
      render json: @notes
    end
  end

 # GET list of notes view
  def indexview

  end

  # GET /notes/1
  def show
    render json: @note
  end

  # POST /notes
  def create
    @note = Note.new(:title => params[:title], :description => params[:description], :category_id => params[:category_id], :user_id => params[:user_id] )

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private
    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:title, :description, :user_id, :category_id)
    end
end
