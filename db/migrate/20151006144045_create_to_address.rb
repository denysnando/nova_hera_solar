class CreateToAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
     t.string      :kind,        :limit => 10
     t.string      :street
     t.string      :number
     t.string      :complement
     t.string      :district
     t.string      :zip_code,    :limit => 20
     t.string      :city
     t.string      :state,       :limit => 2
     t.references  :account
     t.timestamps
    end
  end
end
