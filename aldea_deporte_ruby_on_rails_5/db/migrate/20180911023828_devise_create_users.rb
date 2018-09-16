# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      t.string :user_name,               null: false, default: "", limit: 20
      t.string :first_name,              null: false, default: "", limit: 50
      t.string :last_name,               null: false, default: "", limit: 50
      t.date   :birthday,                null: false, default: ""
      t.string :phone,                   limit: 50
      t.string :document_type,           limit: 30
      t.string :document,                limit: 20
      t.string :document_file,           limit: 50
      t.string :photo,                   limit: 50

      ## Database authenticatable
      t.string :email,              null: false, default: "",limit: 50
      t.string :encrypted_password, null: false, default: "",limit: 100

      ## Recoverable
      t.string   :reset_password_token, limit: 100
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.inet     :current_sign_in_ip
      # t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :users, :user_name,            unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :document,             unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
