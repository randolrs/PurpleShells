class AddSessionLabelToCourseSessions < ActiveRecord::Migration
  def change
    add_column :course_sessions, :session_label, :string, :default => "Session"
  end
end
