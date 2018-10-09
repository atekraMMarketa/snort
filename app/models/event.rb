# == Schema Information
#
# Table name: event
#
#  sid       :integer          unsigned, not null
#  cid       :integer          unsigned, not null
#  signature :integer          unsigned, not null, indexed
#  timestamp :datetime         not null, indexed
#

class Event < ApplicationRecord
  self.table_name  = 'event'
end
