# == Schema Information
#
# Table name: udphdr
#
#  sid       :integer          unsigned, not null
#  cid       :integer          unsigned, not null
#  udp_sport :integer          unsigned, not null, indexed
#  udp_dport :integer          unsigned, not null, indexed
#  udp_len   :integer          unsigned
#  udp_csum  :integer          unsigned
#

class Udphdr < ApplicationRecord
  self.table_name  = 'udphdr'

end
