class FamilyMember < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
