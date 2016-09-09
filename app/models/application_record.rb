class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def coordinate_validation
    if lat >= 90 || lat <= -90
      errors.add(:lat, "must fall between 90 and -90")
    elsif long >= 180 || long <= -180
      errors.add(:long, "must fall between 180 and -180")
    end
  end
end
