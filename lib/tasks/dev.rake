namespace :dev do
   desc "Build System"
   task :build => ["db:drop","db:create","db:migrate"]
   desc "Rebuild System"
   task :rebuild => ["dev:build","db:seed"]
end
