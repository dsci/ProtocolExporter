# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

module CubeRegexp
    
  #
  # opt is an array of hashes like this:
  # :replace => {:char => "b", :with => 10}
  #
  def replace_special_chars(obj,opt=[])
    replaced_string = ""
    opt.each do |entry|
      if entry.has_key?(:replace)
        key = entry[:replace]
        replaced_string = obj.gsub(key[:char],key[:with])
        obj = replaced_string
      end
    end  
    return replaced_string 
  end
end
