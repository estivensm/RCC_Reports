# == Schema Information
#
# Table name: agendas
#
#  id                :integer          not null, primary key
#  nombre            :string
#  empresa           :string
#  cargo             :string
#  telefono          :string
#  celular           :string
#  email             :string
#  direccion_empresa :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Agenda < ApplicationRecord
end
