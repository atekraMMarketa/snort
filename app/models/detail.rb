# == Schema Information
#
# Table name: detail
#
#  detail_type :integer          unsigned, not null, primary key
#  detail_text :text(65535)      not null
#

class Detail < ApplicationRecord
  self.table_name  = 'detail'

end
