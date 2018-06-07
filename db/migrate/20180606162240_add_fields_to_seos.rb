class AddFieldsToSeos < ActiveRecord::Migration[5.2]
  def change
    add_reference :seos, :post, index: true, foreign_key: true
    add_reference :seos, :user, index: true, foreign_key: true
  end
end
