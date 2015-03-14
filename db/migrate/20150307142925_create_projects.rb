class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :architect
      t.string :name, :details, required: true
      t.boolean :complete, :featured, required: true

      t.timestamps null: false
    end

    create_table :architects do |t|
      t.string :name, :website, required: true

      t.timestamps null: false
    end

    create_table :services do |t|
      t.string :name
    end

    create_table :projects_services do |t|
      t.references :project
      t.references :service
    end
  end
end
