# == Schema Information
#
# Table name: icmphdr
#
#  sid       :integer          unsigned, not null
#  cid       :integer          unsigned, not null
#  icmp_type :integer          unsigned, not null, indexed
#  icmp_code :integer          unsigned, not null
#  icmp_csum :integer          unsigned
#  icmp_id   :integer          unsigned
#  icmp_seq  :integer          unsigned
#

class Icmphdr < ApplicationRecord
  self.table_name  = 'icmphdr'

end
