class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :tag

  def should_generate_new_friendly_id?
    title_changed?
  end
end
