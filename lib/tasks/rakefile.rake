require 'rake/testtask'

namespace :test do
  Rake::TestTask.new(:api) do |t|
    t.pattern = 'test/controllers/api/*_test.rb'
  end

  desc 'Run API tests'
  task api: :environment do
    Rake::Task['test:api'].invoke
  end
end

desc 'Run all tests'
task test: ['test:api']
