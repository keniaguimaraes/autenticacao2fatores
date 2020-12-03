class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :titulo
      t.text :mensagem
      t.string :usuario
      t.datetime :data

      t.timestamps
    end
  end
end
