class CreateActiveSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :active_sessions do |t|
      t.references :user,            null: false, foreign_key: {on_delete: :cascade}
      t.string     :user_agent
      t.string     :ip_address

      # Remebered login
      t.string     :remember_token,  null: false

      t.timestamps
    end

    add_index :active_sessions, :user_agent
    add_index :active_sessions, :ip_address
    add_index :active_sessions, :remember_token, unique: true
  end
end
