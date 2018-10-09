# == Schema Information
#
# Table name: reference_system
#
#  ref_system_id   :integer          unsigned, not null, primary key
#  ref_system_name :string(20)
#

class ReferenceSystem < ApplicationRecord
  self.table_name  = 'reference_system'

end
