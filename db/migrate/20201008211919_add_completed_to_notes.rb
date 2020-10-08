# frozen_string_literal: true

class AddCompletedToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :completed, :boolean, default: false
  end
end
