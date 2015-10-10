class AddAttachmentAvatarToDatabases < ActiveRecord::Migration
 def up
    add_attachment :databases, :image
  end

  def down
    remove_attachment :databases, :image
  end
end
