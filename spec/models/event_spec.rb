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

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
