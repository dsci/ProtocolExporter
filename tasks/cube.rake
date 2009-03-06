require 'find'
require 'fileutils'
require 'yaml'

namespace :cube do 
  desc "cleansup the distribution directory"
  task :clean do
    FileUtils::rm_rf('dist') if File.exists?("dist")
  end 
  
  desc "creates a config file with all protocol loctaions"
  task :config do
    tree={"protocols" => {"df" => "df_protokoll.xls", "wu" => "wu_protokoll.xls","spz" => "spaltzug.xls"}}
    File.open("config.yml","w") do |f|
        YAML.dump(tree,f)
    end
  end

  desc "compiles the application into an executable file"
  task :compile do
    sh "compile.bat"
    #rename exe 
    FileUtils.mv("src.exe", "Protocol2Excel.exe")
  end
  
  desc "creates a distribution folder with config stuff"
  task :distribute => [:clean,:compile,:config] do
    FileUtils::mkdir('dist')
    FileUtils.cp_r 'excel/.', 'dist'
    # move images to dist directory
    FileUtils.cp_r 'src/images', 'dist' 
    FileUtils.mv("Protocol2Excel.exe","dist/")
    FileUtils.mv("config.yml","dist/")
    FileUtils.cp_r("src/config", 'dist/')
    FileUtils.cp("C:\\Windows\\system32\\mingwm10.dll", 'dist/')
  end
end