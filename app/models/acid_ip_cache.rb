# == Schema Information
#
# Table name: acid_ip_cache
#
#  ipc_ip              :integer          unsigned, not null, primary key, indexed
#  ipc_fqdn            :string(50)
#  ipc_dns_timestamp   :datetime
#  ipc_whois           :text(65535)
#  ipc_whois_timestamp :datetime
#

class AcidIpCache < ApplicationRecord
  self.table_name  = 'acid_ip_cache'

end
