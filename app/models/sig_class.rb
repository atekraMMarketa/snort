# == Schema Information
#
# Table name: sig_class
#
#  sig_class_id   :integer          unsigned, not null, primary key, indexed
#  sig_class_name :string(60)       not null, indexed
#

class SigClass < ApplicationRecord
  self.table_name  = 'sig_class'

end
