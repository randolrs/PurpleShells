class CreateClassTopics < ActiveRecord::Migration
  def change
    create_table :class_topics do |t|
      t.integer :parent_topic_id
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
