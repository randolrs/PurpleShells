class ClassTopic < ActiveRecord::Base

	def child_topics

		child_topics = ClassTopic.where(:parent_topic_id => self.id)

		if child_topics

			return child_topics
		else

			return nil
		end

	end
end
