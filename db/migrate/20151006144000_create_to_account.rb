class CreateToAccount < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :cpf
      t.string :cnpj
      t.string :rg
      t.string :email
      t.string :phone
      t.string :cell

      t.timestamps
    end
  end
end
