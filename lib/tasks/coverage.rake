namespace :spec do
  desc "Executes spec with code coverage reports"
  task :coverage do
    ENV['COVERAGE'] = '1'
    Rake::Task[:spec].invoke
  end
end
