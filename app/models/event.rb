# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  day         :string(255)
#  start_time  :time
#  end_time    :time
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  validates :day, :start_time, :end_time, :description, presence: true
  validate :end_cannot_be_before_start

    def end_cannot_be_before_start
      if start_time > end_time
        errors.add(:end_time, "can't be before start time")
      end
    end
end
