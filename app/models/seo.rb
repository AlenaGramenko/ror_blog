class Seo < ApplicationRecord
  belongs_to :seoble, polymorphic: true
end
