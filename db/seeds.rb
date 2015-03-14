Service.destroy_all

['CNC', 'Interior', 'Exterior'].each do |state|
  Service.create(name:state)
end

Architect.destroy_all

['Arch1', 'Arch2', 'Arch3'].each do |state|
  Architect.create(name:state)
end
