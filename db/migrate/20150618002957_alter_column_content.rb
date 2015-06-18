class AlterColumnContent < ActiveRecord::Migration
  def up
    change_column(:stories, :content, :text)
  end

  def down
    change_column(:stories, :content, :string)
  end
end
