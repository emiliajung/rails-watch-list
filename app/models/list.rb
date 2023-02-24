class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true

  validate :check_for_bookmarks

  private

  def check_for_bookmarks
    if bookmarks.any?
     errors.add(:base, 'Cannot delete a list with bookmarks.')
    end
  end
end
