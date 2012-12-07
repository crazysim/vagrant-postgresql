
pg_database "biblioteca" do
  owner "postgres"
  encoding "utf8"
  template "template0"
  locale "en_US.UTF8"
end

template "/tmp/biblioteca.sql" do
  source "biblioteca.sql.erb"
  mode   "0644"
end

execute "importing biblioteca data" do
  user "postgres"
  command "psql -d biblioteca -f /tmp/biblioteca.sql"
end
