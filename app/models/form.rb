class Form < ApplicationRecord
  String :title
  serialize :data, Hash
  # has_one :response, dependent: :destroy
  belongs_to :user

end
