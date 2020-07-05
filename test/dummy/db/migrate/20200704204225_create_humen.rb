# frozen_string_literal: true

class CreateHumen < ActiveRecord::Migration[6.0]
  def change
    create_table :humen do |t|
      t.string :name

      t.timestamps
    end
  end
end
