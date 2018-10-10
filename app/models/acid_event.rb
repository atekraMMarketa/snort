# == Schema Information
#
# Table name: acid_event
#
#  sid          :integer          unsigned, not null
#  cid          :integer          unsigned, not null
#  signature    :integer          unsigned, not null, indexed
#  sig_name     :string(255)      indexed
#  sig_class_id :integer          unsigned, indexed
#  sig_priority :integer          unsigned, indexed
#  timestamp    :datetime         not null, indexed
#  ip_src       :integer          unsigned, indexed
#  ip_dst       :integer          unsigned, indexed
#  ip_proto     :integer          indexed
#  layer4_sport :integer          unsigned, indexed
#  layer4_dport :integer          unsigned, indexed
#

class AcidEvent < ApplicationRecord
  require 'ipaddr'

  self.table_name  = 'acid_event'
  #self.primary_key = [:sid, :cid]

  def sig_class_name
    SigClass.find(sig_class_id).present? ? SigClass.find(sig_class_id).sig_class_name : "None class name"
  end

  def sensor_hostname
    Sensor.find(sid).present? ? Sensor.find(sid).hostname : "Invalid sensor hostname"
  end

  def ipv4_source
    IPAddr.new(ip_src, Socket::AF_INET).to_s
  end

  def ipv4_destination
    IPAddr.new(ip_dst, Socket::AF_INET).to_s
  end
end
