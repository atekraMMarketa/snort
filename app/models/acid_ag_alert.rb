# == Schema Information
#
# Table name: acid_ag_alert
#
#  ag_id  :integer          unsigned, not null, indexed
#  ag_sid :integer          unsigned, not null, indexed => [ag_cid]
#  ag_cid :integer          unsigned, not null, indexed => [ag_sid]
#

class AcidAgAlert < ApplicationRecord
  self.table_name  = 'acid_ag_alert'

end
