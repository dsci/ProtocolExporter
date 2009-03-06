# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'log4r'

module Loggr
  
    def logger
      mylog = Log4r::Logger.new 'mylog'
      mylog.outputters = Log4r::Outputter.stdout
      return mylog
    end
    
    def doLogging(log,message)
      log.debug(message)
    end
end
