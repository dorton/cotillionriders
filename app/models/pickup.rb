class Pickup < ActiveRecord::Base
  belongs_to :student
  belongs_to :user

  has_paper_trail :on => [:update, :destroy], :only => [:current_pickup]

  include PgSearch
  pg_search_scope :search, :associated_against => {
    :student => [:first_name, :last_name],
    :user => [:first_name, :last_name],
  },
  :using => {:tsearch => {:prefix => true}}

  def student_last_name
    self.student.last_name
  end
end
