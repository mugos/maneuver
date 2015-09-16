class InitialMigrations < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.text :script
      t.timestamps
    end

    create_table :gits do |t|
      t.string :url
      t.string :user_name
      t.string :repo_name
      t.string :oauth_token
      t.string :oauth_secret
      t.string :client_id
      t.string :client_secret
      t.string :adapter
      t.string :type
      t.references :app, index: true
      t.timestamps
    end

    create_table :hosts do |t|
      t.string :name
      t.string :address
      t.string :sys_user
      t.string :source
      t.references :key, index: true
      t.timestamps
    end

    create_table :keys do |t|
      t.string :name
      t.string :value
      t.timestamps
    end

    create_join_table :apps, :hosts

    create_table :builds do |t|
      t.string :state
      t.references :app, index: true
      t.references :host, index: true
      t.timestamp :completed_at
      t.string :type
      t.timestamps
    end

    create_table :logs do |t|
      t.string :name
      t.string :value
      t.references :logable, polymorphic: true, index: true
      t.timestamps null: false
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
  end
end
