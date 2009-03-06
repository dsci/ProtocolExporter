# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class AppHelper
  @@spaltNeu = false
  @@config = ""
  
  def self.readConfig(path)
    #path = "#{Dir.pwd}/config.yml"
    @@config = YAML::load(File.open(path))
  end
  
  def self.config
    @@config
  end
  
  def self.wu_protokoll_location
    AppHelper.config["protocols"]["wu"]
  end
  
  def self.df_protokoll_location
    AppHelper.config["protocols"]["df"]
  end
  
  def self.spz_protokoll_location
    AppHelper.config["protocols"]["spz"]
  end
  
  
  
  def self.spaltzugArray
    @@spalt
  end
  
  def self.initSpaltZugArray
    @@spalt = []
  end
  
  
  
  #
  # wird gesetzt, wenn Spaltzug das erste Mal geoeffnet wird
  #
  def self.spaltzugNeu(flag = nil)
    unless flag.nil?
      @@spaltNeu = true
    end
    @@spaltNeu
  end
  
  def self.readInfo
    path = "#{Dir.pwd}/config/info.cfg"
    text = ""
    File.open(path) do |f|
      while line = f.gets
        text << line
      end
    end
    
    text
  rescue 
    text
  end
  
end
