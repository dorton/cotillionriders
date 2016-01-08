class Version < ActiveRecord::Base

  scope :lined_up, -> { where(object_changes: "--- current_pickup: - false - true" ) }
  scope :picked_up, -> { where(object_changes: "--- current_pickup: - true - false" ) }

end
