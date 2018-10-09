# == Schema Information
#
# Table name: sensor
#
#  sid       :integer          unsigned, not null, primary key
#  hostname  :text(65535)
#  interface :text(65535)
#  filter    :text(65535)
#  detail    :integer
#  encoding  :integer
#  last_cid  :integer          unsigned, not null
#

class Sensor < ApplicationRecord
  self.table_name  = 'sensor'

end
