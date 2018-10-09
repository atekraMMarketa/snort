# == Schema Information
#
# Table name: iphdr
#
#  sid      :integer          unsigned, not null
#  cid      :integer          unsigned, not null
#  ip_src   :integer          unsigned, not null, indexed
#  ip_dst   :integer          unsigned, not null, indexed
#  ip_ver   :integer          unsigned
#  ip_hlen  :integer          unsigned
#  ip_tos   :integer          unsigned
#  ip_len   :integer          unsigned
#  ip_id    :integer          unsigned
#  ip_flags :integer          unsigned
#  ip_off   :integer          unsigned
#  ip_ttl   :integer          unsigned
#  ip_proto :integer          unsigned, not null
#  ip_csum  :integer          unsigned
#

class Iphdr < ApplicationRecord
  self.table_name  = 'iphdr'

end
