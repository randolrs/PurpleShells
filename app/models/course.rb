class Course < ActiveRecord::Base

	has_many :course_sessions, :dependent => :destroy

	belongs_to :user

	accepts_nested_attributes_for :course_sessions, allow_destroy: true
end
