# == Schema Information
#
# Table name: base_users
#
#  usr_id      :integer          not null, primary key
#  usr_login   :string(25)       not null, indexed
#  usr_pwd     :string(32)       not null
#  usr_name    :string(75)       not null
#  role_id     :integer          not null
#  usr_enabled :integer          not null
#

class BaseUsers < ApplicationRecord
  self.table_name  = 'base_users'

end
