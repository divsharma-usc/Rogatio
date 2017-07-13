class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user,index:true,foreign_key: true
      t.text :question,null: false
      t.timestamps null: false
    end
  end
end
