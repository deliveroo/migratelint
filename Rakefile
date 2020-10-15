require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

# Run the utility against the testdata directory.
task :integration do
  system "exe/migratelint check ./testdata/*.sql"
end
