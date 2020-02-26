# frozen_string_literal: true

class AtivaExtensaoUnaccent < ActiveRecord::Migration[6.0]
  def up
    execute 'CREATE EXTENSION unaccent;'
  end

  def down
    execute 'DROP EXTENSION unaccent;'
  end
end
