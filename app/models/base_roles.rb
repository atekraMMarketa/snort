# == Schema Information
#
# Table name: base_roles
#
#  role_id   :integer          not null, primary key
#  role_name :string(20)       not null
#  role_desc :string(75)       not null
#

class BaseRoles < ApplicationRecord
  self.table_name  = 'base_roles'

end
