class Form < ApplicationRecord
  String :title
  has_one :response, dependent: :destroy
  belongs_to :user

end
