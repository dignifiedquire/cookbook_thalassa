actions :create, :delete
default_action :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :bind, :kind_of => [ String, Array ], :default => 'localhost:80'
attribute :backend, :kind_of => String, :required => true
attribute :mode, :kind_of => String, :default => 'http'
attribute :keepalive, :kind_of => String, :default => 'default'
attribute :rules, :kind_of => Array, :default => []
attribute :natives, :kind_of => Array, :default => []
