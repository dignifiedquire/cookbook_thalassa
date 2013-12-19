actions :create, :update, :delete
default_action :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :type, :kind_of => String, :required => true
attribute :role, :kind_of => String
attribute :version, :kind_of => String
attribute :balance, :kind_of => String, :default => 'roundrobin'
attribute :host, :kind_of => String, :default => nil
attribute :mode, :kind_of => String, :default => 'http'
attribute :health, :kind_of => Hash, :default => {}
attribute :members, :kind_of => Array, :default => []
attribute :natives, :kind_of => Array, :default => []
