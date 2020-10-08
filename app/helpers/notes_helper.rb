# frozen_string_literal: true

module NotesHelper
  def note_completed?(note)
    note.completed? ? 'shdcom' : 'shd'
  end
end
