# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 
class String
  def downcase_and_sym
    self.downcase.to_sym
  end
  
  def split_t
    self.split('T')
    #tmp = self.split('.')
    #tmp.split.last.split('-')
    #return temp[0]
  end
  
end

class Array
  def to_german_date_string
    tmp = self[0]
    k = tmp.split("-")
    jahr = k[0]
    monat = k[1]
    tag = k[2]
    
    "#{tag}.#{monat}.#{jahr}"
  end
end