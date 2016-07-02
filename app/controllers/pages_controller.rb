class PagesController < ApplicationController
  def home

  	  	@topics_index = ClassTopic.all.where(:parent_topic_id =>1)
  	  	
  	if user_signed_in?

  		@user = current_user
  	end

  end
end
