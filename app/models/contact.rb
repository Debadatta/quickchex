class Contact < ActiveRecord::Base
  def formatted_time
    created_at.strftime("%I:%M %p")
  end
  def day
    updated_at.strftime("%A")
  end
end
