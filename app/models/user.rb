class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


         def full_name

         	if self.name

         		return self.name
         	else

         		return nil

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
end
