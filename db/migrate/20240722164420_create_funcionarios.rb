class CreateFuncionarios < ActiveRecord::Migration[7.2]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :email
      t.date :dataNascimento
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
