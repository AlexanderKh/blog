class AddUserToArticle < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.belongs_to :user, index: true, foreign_key: true
    end
  end
end
