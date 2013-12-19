include Chef::ThalassaAqueduct

def whyrun_supported?
  true
end

action :create do
  converge_by "Creating Thalassa Aqueduct backend: #{new_resource}" do
    create_backend
    new_resource.updated_by_last_action(true)
  end
end

action :update do
  converge_by "Updating Thalassa Aqueduct backend: #{new_resource}" do
    update_backend
    new_resource.updated_by_last_action(true)
  end
end

action :delete do
  converge_by "Deleting Thalassa Aqueduct backend: #{new_resource}" do
    delete_backend
    new_resource.updated_by_last_action(true)
  end
end