class CreateCourseSessions < ActiveRecord::Migration
  def change
    create_table :course_sessions do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
