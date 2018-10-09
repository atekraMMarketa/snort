# == Schema Information
#
# Table name: tcphdr
#
#  sid       :integer          unsigned, not null
#  cid       :integer          unsigned, not null
#  tcp_sport :integer          unsigned, not null, indexed
#  tcp_dport :integer          unsigned, not null, indexed
#  tcp_seq   :integer          unsigned
#  tcp_ack   :integer          unsigned
#  tcp_off   :integer          unsigned
#  tcp_res   :integer          unsigned
#  tcp_flags :integer          unsigned, not null, indexed
#  tcp_win   :integer          unsigned
#  tcp_csum  :integer          unsigned
#  tcp_urp   :integer          unsigned
#

class Tcphdr < ApplicationRecord
  self.table_name  = 'tcphdr'

end
