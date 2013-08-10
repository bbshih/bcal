# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  day         :string(255)
#  start_time  :datetime
#  end_time    :datetime
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  validates :day, :start_time, :end_time, :description, presence: true
  validate :end_cannot_be_before_start

  def end_cannot_be_before_start
    if (start_time && end_time) && (start_time > end_time)
      errors.add(:end_time, "can't be before start time")
    end
  end

  def full_details
  end

  def full_details=(details)
    if !details.blank?
      # details example: Monday 12:00pm-1:30pm lunch with Billy
      split_details = details.split
      if split_details.length > 2
        self.day = split_details[0]
        split_times = split_details[1].split('-')
        puts self.start_time = Time.zone.parse(split_times[0])
        puts self.end_time = Time.zone.parse(split_times[1])

        i = 2
        description_text = ""
        while i < split_details.length
          description_text += " " + split_details[i]
          i += 1
        end
        self.description = description_text
      end
    end
  end
end
