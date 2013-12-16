include Chef::ThalassaAqueduct

def whyrun_supported?
  true
end

action :create do
  converge_by "Creating Thalassa Aqueduct frontend: #{new_resource}" do
    create_frontend
    new_resource.updated_by_last_action(true)
  end
end

action :delete do
  converge_by "Deleting Thalassa Aqueduct frontend: #{new_resource}" do
    delete_frontend
    new_resource.updated_by_last_action(true)
  end
end