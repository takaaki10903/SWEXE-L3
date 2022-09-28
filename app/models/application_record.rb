class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :message,  presence: true
  validates :message, length: { maximum: 140 }
end
