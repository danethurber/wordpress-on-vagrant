require_recipe "apt"
require_recipe "build-essential"

require_recipe "mysql"
require_recipe "php"
require_recipe "apache2"
require_recipe "openssl"
require_recipe "wordpress"

execute "replace themes folder" do
  command "sudo rm -rf /var/www/wordpress/wp-content/themes && sudo ln -s /vagrant/themes /var/www/wordpress/wp-content/themes"
  action :run
end
