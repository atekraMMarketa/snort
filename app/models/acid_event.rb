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
  self.table_name  = 'acid_event'

end
