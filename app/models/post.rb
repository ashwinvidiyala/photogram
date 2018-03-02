class Post < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { large: "600X600>", medium: "300X300>", thumb: "150X150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
