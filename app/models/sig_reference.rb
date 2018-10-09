# == Schema Information
#
# Table name: sig_reference
#
#  sig_id  :integer          unsigned, not null
#  ref_seq :integer          unsigned, not null
#  ref_id  :integer          unsigned, not null
#

class SigReference < ApplicationRecord
  self.table_name  = 'sig_reference'

end
