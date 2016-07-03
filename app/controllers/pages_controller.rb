class PagesController < ApplicationController
  def home

	@topics_index = ClassTopic.all.where(:parent_topic_id =>1)

	@locations = Location.all
  	  	
  	if user_signed_in?

  		@user = current_user
  	end

  end

  def user_city_initialize

  	current_user.update(:city_id => params[:cityID])

  	redirect_to root_path

  end

  def classes_summary

  	if user_signed_in?

  		if current_user.city_id

  			@city = City.find(current_user.city_id)
  		end

  	end

  	@topics_index = ClassTopic.all.where(:parent_topic_id =>1)

  end

  def user_profile

  	


  end

end
