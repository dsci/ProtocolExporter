# Author: Daniel Schmidt <demo.code@gmail.com>
# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'yaml'

class SettingsReader
  def initialize
  end
  
  def self.loadDruckProtokol
    d = YAML::load(File.open('C:\\Documents and Settings\\daniel_schmidt\\Work\\Bilfinger\\ruby\\src\\settings.yml'))
    d['excel_druck_prot']
  end
  
  def self.loadWUProtokol
    
  end
end
