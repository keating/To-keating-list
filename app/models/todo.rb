class Todo < ActiveRecord::Base

  validates :title, presence: true

  enum status: [ :active, :archived ]

  scope :active, -> { where status: statuses[:active] }
  scope :archived, -> { where status: statuses[:archived] }

  def done
    self.archived!
  end

end
