class Task < ApplicationRecord
  belongs_to :family_member

  enum status: {
    incomplete: 0,
    complete: 1
  }
end
