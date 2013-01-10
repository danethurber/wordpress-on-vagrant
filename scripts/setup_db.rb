require "mechanize"
require "highline/import"

puts "#{Time.now} Installing Wordpress Database..."

site_uri = ask("URL?  ") { |q| q.default = "http://localhost:4567/" }

mech = Mechanize.new
mech.get("#{ site_uri }wp-admin/install.php") do |page|
  signup = page.form_with(:action => 'install.php?step=2') do |f|
    f.weblog_title = ask("Site Title?  ") { |q| q.default = "Awesome xCross" }
    f.user_name = ask("Username? ") { |q| q.default = "admin" }
    f.admin_password = ask("Password? ") { |q| q.default = "passpass" }
    f.admin_password2 = ask("Password Confirm? ") { |q| q.default = "passpass" }
    f.admin_email = ask("Email? ") { |q| q.default = "test@heyyoukid.com" }
  end.click_button
end

puts "#{Time.now} Installing Plugins..."

puts "#{Time.now} Installing Theme..."
