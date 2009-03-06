# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 
class String
  def downcase_and_sym
    self.downcase.to_sym
  end
  
  def split_t
    self.split('T')
  end
  
end

class Array
  def to_german_date_string
    jahr = self[0]
    monat = self[1]
    tag = self[2]
    
    "#{tag}.#{monat}.#{jahr}"
  end
end