class Account < ActiveRecord::Base
  has_one :address
  belongs_to :budget


  STATES = [
    ["AC - Acre", "AC"],
    ["AL - Alagoas", "AL"],
    ["AM - Amazonas", "AM"],
    ["AP - Amapá", "AP"],
    ["BA - Bahia", "BA"],
    ["CE - Ceara", "CE"],
    ["DF - Distrito Federal", "DF"],
    ["ES - Espírito Santo", "ES"],
    ["GO - Goiás", "GO"],
    ["MA - Maranhão", "MA"],
    ["MG - Minas Gerais", "MG"],
    ["MS - Mato Grosso do Sul", "MS"],
    ["MT - Mato Grosso", "MT"],
    ["PA - Pará", "PA"],
    ["PB - Paraíba", "PB"],
    ["PE - Pernambuco", "PE"],
    ["PI - Piauí", "PI"],
    ["PR - Paraná", "PR"],
    ["RJ - Rio de Janeiro", "RJ"],
    ["RN - Rio Grande do Norte", "RN"],
    ["RO - Rondônia", "RO"],
    ["RR - Roraima", "RR"],
    ["RS - Rio Grande do Sul", "RS"],
    ["SC - Santa Catarina", "SC"],
    ["SE - Sergipe", "SE"],
    ["SP - São Paulo", "SP"],
    ["TO - Tocantins", "TO"]
  ]

end
