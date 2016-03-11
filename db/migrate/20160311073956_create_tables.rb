class CreateTables < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :parent_1
      t.string :parent_2
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :address_4
      t.string :email
      t.string :language_1
      t.string :language_2

      t.timestamps null: false
    end

    create_table :children do |t|
      t.string :name
      t.integer :age
      t.date :birthday
      t.string :current_school
      t.boolean :enrollment_status
      t.references :family, index: true, foreign_key: true

      t.timestamps null: false
    end

    create_table :schools do |t|
      t.string :name
      t.string :address
      t.text :description

      t.timestamps null: false
    end

    create_table :grades do |t|
      t.string :program
      t.string :school_grade
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end

    create_table :applications do |t|
      t.string :description
      t.references :child, index: true, foreign_key: true
      t.references :grade, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
