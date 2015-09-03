class InitialMigrations < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :git
      t.text :script
      t.timestamps
    end

    # create_table :users do |t|
    #   t.string :email, limit: 255
    #   t.string :password_digest, limit: 255
    #   t.string :confirmation_token, limit: 255
    #
    #   t.timestamps
    # end
    #
    # add_index :users, :email, unique: true
    #
    # create_table :app_confs do |t|
    #   t.text :key
    #   t.text :value
    #   t.timestamps
    # end
    #
    # create_table :hosts do |t|
    #   t.string :name
    #   t.string :address
    #   t.references :key, index: true
    # end
    #
    # create_table :task_logs do |t|
    #   t.string :name
    #   t.string :desc
    #   t.string :state
    #   t.string :type
    #
    #   t.references :app, index: true
    #   t.references :host, index: true
    #
    #   t.timestamps
    # end
    #
    # create_table :tasks do |t|
    #   t.string :name
    #   t.string :desc
    #   t.text :script
    #   t.timestamps
    # end
    #
    # create_table :keys do |t|
    #   t.string :name
    #   t.string :value
    #   t.timestamps
    # end
    #
    # create_table :logs do |t|
    #   t.string :name
    #   t.string :value
    #   t.references :logable, polymorphic: true, index: true, index: true
    #   t.timestamps null: false
    # end
  end
end
