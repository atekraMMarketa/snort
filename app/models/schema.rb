# == Schema Information
#
# Table name: schema
#
#  vseq  :integer          unsigned, not null, primary key
#  ctime :datetime         not null
#

class Schema < ApplicationRecord
  self.table_name  = 'schema'

end
