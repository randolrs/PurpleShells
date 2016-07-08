class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    belongs_to :city

    has_many :courses, :dependent => :destroy

    has_many :course_sessions

    has_attached_file :image, 
        :styles => { :medium => "194x194#", :small => "70x70#", :thumb => "30x30#"}, 
        :default_url => 'missing_:style.png',
        :s3_protocol => :https

    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


        # bypasses Devise's requirement to re-enter current password to edit
    def update_with_password(params={}) 
      if params[:password].blank? 
        params.delete(:password) 
        params.delete(:password_confirmation) if params[:password_confirmation].blank? 
      end 
      update_attributes(params) 
    end



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
