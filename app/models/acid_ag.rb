# == Schema Information
#
# Table name: acid_ag
#
#  ag_id    :integer          unsigned, not null, primary key, indexed
#  ag_name  :string(40)
#  ag_desc  :text(65535)
#  ag_ctime :datetime
#  ag_ltime :datetime
#

class AcidAg < ApplicationRecord
  self.table_name  = 'acid_ag'

end
