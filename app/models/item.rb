class Item < ActiveRecord::Base
  belongs_to :user

  def days_left
     ((created_at + 8.days) - Time.now).to_i / (24 * 60 * 60)
  end

end
