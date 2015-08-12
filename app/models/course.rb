class Course < ActiveRecord::Base

  validates :Name, presence: true
  validates :Qualification, presence: true
  belongs_to :student_courses

end