class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    belongs_to :city

    has_many :courses, :dependent => :destroy

    has_many :course_sessions

         def full_name

         	if self.name

         		return self.name
         	else

         		return nil

         	end
         	
         end

         def city_name

            if self.city_id

                cityName = City.find(self.city_id).name

                return cityName
            else


                return "your city"
            end

         end


         def basic_profile

         	return true
         end

         def admin
         	
         	return true
         end

         def has_enrolled_in_a_class

         	return false

         end

         def set_default_location

         	return false

         end

         def has_a_saved_class

            if self.courses.count > 0
                return true
            else
                return false
            end

         end
end
