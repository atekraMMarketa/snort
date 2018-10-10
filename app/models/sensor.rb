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

  def sensor_detail
    Detail.where(:detail_type => detail).present? ? Detail.where(:detail_type => detail).first.detail_text : "Invalid detail"
  end

  def sensor_encoding
    #SnortEncoding.where(:encoding_type => encoding).present? ? SnortEncoding.where(:encoding_type => encoding).first.encoding_text : "Invalid encoding"
    # TODO
  end

  def last_log_time
    AcidEvent.where(:cid => last_cid).present? ? AcidEvent.where(:cid => last_cid).first.timestamp : "Invalid last event"
  end
end
