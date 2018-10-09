# == Schema Information
#
# Table name: opt
#
#  sid       :integer          unsigned, not null
#  cid       :integer          unsigned, not null
#  optid     :integer          unsigned, not null
#  opt_proto :integer          unsigned, not null
#  opt_code  :integer          unsigned, not null
#  opt_len   :integer
#  opt_data  :text(65535)
#

class Opt < ApplicationRecord
  self.table_name  = 'opt'

end
