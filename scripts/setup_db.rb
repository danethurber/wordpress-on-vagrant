require "mechanize"

# TODO: prompt for this information
blog_opts = {
  :base_uri => 'http://localhost:4567/',
  :admin_title => 'Test Blog',
  :admin_user => 'admin',
  :admin_email =>'test@testing-shit.com',
  :admin_password => 'passpass'
}

puts "#{Time.now} Installing Wordpress Database..."

mech = Mechanize.new
mech.get("#{ blog_opts[:base_uri] }wp-admin/install.php") do |page|
  signup = page.form_with(:action => 'install.php?step=2') do |f|
    f.weblog_title = blog_opts[:weblog_title]
    f.user_name = blog_opts[:admin_user]
    f.admin_password = blog_opts[:admin_password]
    f.admin_password2 = blog_opts[:admin_password]
    f.admin_email = blog_opts[:admin_email]
  end.click_button
end


puts "#{Time.now} Installing Plugins..."

puts "#{Time.now} Installing Theme..."
