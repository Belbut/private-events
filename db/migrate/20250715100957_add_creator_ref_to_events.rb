class AddCreatorRefToEvents < ActiveRecord::Migration[8.0]
  def change
    # https://edgeapi.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-add_reference
    add_reference :events, :creator, null: false, foreign_key: { to_table: :users }
  end
end
