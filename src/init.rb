# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'modules.rb'

include Qt

class InitStuff
  
  include Loggr
  
  def initialize
    
  end
  
  def readConfig
    AppHelper.readConfig("#{Dir.pwd}/config.yml")
    log = logger
    #doLogging(log,AppHelper.df_protokoll_location)
    doLogging(log,"Fenster nicht schliessen!")
  end
  
  
end

if __FILE__==$0
  init = InitStuff.new
  init.readConfig
  app = Application.new(ARGV)
  #app.setStyle(PlastiqueStyle.new())
  view = MainView.new
  view.setWindowTitle("Export ZLBProtokoll")
  view.show()
  app.exec()

end
