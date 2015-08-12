class Student < ActiveRecord::Base

  validates :FirstName, presence: true
  validates :LastName, presence: true
  validates :Sex, presence: true
  validates :Address1, presence: true
  validates :Town, presence: true
  validates :County, presence: true
  validates :MainNumber, presence: true
  validates :Course, presence: true
  validates :Tutor, presence: true

  def self.search(search)
    if search
      where('FirstName LIKE ? OR LastName LIKE ? OR Sex LIKE ? OR Address1 LIKE ? OR Address2 LIKE ? OR Town LIKE ? OR County LIKE ? OR PostCode LIKE ? OR MainNumber LIKE ? OR Course LIKE ? OR Tutor LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

end
