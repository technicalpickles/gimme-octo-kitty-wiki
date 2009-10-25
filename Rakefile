require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "gimme-octo-kitty-wiki"
    gem.summary = %Q{A script to pull down a project's wiki on GitHub locally.}
    gem.description = %Q{GitHub's wiki doesn't currently have an API to call it's own, so this gem was created as a stopgap. For now, it lets you pull down the content of a project's GitHub wiki}
    gem.email = "josh@technicalpickles.com"
    gem.homepage = "http://github.com/technicalpickles/gimme-octo-kitty-wiki"
    gem.authors = ["Joshua Nichols"]
    gem.add_dependency 'nokogiri'
    gem.add_dependency 'stringex'
    gem.add_dependency 'git'

    gem.add_development_dependency "rspec"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "gimme-octo-kitty-wiki #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
