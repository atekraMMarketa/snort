# == Schema Information
#
# Table name: reference
#
#  ref_id        :integer          unsigned, not null, primary key
#  ref_system_id :integer          unsigned, not null
#  ref_tag       :text(65535)      not null
#

class Reference < ApplicationRecord
  self.table_name  = 'reference'

end
