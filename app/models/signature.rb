# == Schema Information
#
# Table name: signature
#
#  sig_id       :integer          unsigned, not null, primary key
#  sig_name     :string(255)      not null, indexed
#  sig_class_id :integer          unsigned, not null, indexed
#  sig_priority :integer          unsigned
#  sig_rev      :integer          unsigned
#  sig_sid      :integer          unsigned
#  sig_gid      :integer          unsigned
#

class Signature < ApplicationRecord
  self.table_name  = 'signature'

  has_one :event

  def sig_class_name
    SigClass.find(sig_class_id).present? ? SigClass.find(sig_class_id).sig_class_name : "None class name"
  end
end
