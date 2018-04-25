class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @event = Event.find(params[:event_id])
    @notes = @event.notes
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
     event = Event.find(params[:event_id])
     @note = event.notes.find(params[:id])
  end

  # GET /notes/new
  def new
    event = Event.find(params[:event_id])
    puts params
    puts event, params[:event_id]
    puts event.notes
    @note = event.notes.new
    
  end

  # GET /notes/1/edit
  def edit
      event = Event.find(params[:event_id])
      @note = event.notes.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    event = Event.find(params[:event_id])
    @note = event.notes.create(note_params)
    
    respond_to do |format|
      if @note.save 
        format.html { redirect_to [@note.event,@note], notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    event = Event.find(params[:event_id])
    @note = event.notes.find(params[:id])
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to [event, @note], notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    event = Event.find(params[:event_id])
    @note = event.notes.find(params[:id])
    @note.destroy
    respond_to do |format|
      format.html { redirect_to event_notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:Events_id, :Users_id, :description)
    end
end
