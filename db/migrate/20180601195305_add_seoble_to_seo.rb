class AddSeobleToSeo < ActiveRecord::Migration[5.2]
  def change
    add_reference :seos, :seoble, polymorphic: true
  end
end
