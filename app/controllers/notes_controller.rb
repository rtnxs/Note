# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @ransack_search = Note.ransack(params[:q])
    @notes = @ransack_search.result.order('completed')
  end

  def show; end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: 'Note was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to root_path, notice: 'Note was successfully updated.' }
      else
        format.html { render :update }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_path, notice: 'Note was successfully destroyed.' }
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body, :completed)
  end
end
