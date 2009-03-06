# Author: Daniel Schmidt <demo.code@gmail.com>
# 
# To change this template, choose Tools | Templates
# and open the template in the editor.


class DruckProtokoll < Protocol  
  
  def self.fields
    #fields = %w[]
    #fields + self.init_fields       
    self.init_fields
  end

end
