# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  day         :string(255)
#  start       :time
#  end         :time
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
end
