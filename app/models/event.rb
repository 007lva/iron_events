class Event < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 60 }
  #validates :description, length: { minimum: 100 }, allow_blank: true
  #validate :start_at_is_present, :end_at_is_present, :start_at_is_before_end_at

  private

  def start_at_is_present
    unless start_at
      errors.add(:start_at, "can't be blank")
    end
  end

  def end_at_is_present
    unless end_at
      errors.add(:end_at, "can't be blank")
    end
  end

  def start_at_is_before_end_at
    if start_at and end_at and (start_at > end_at)
      errors.add(:start_at, "can't be after than end date")
    end
  end

  def self.for_today
    where(["DATE(start_at) = ?", Date.today])
  end

end
