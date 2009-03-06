# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 
require 'src/cube_regexp'

describe CubeRegexp do
  before(:each) do
    class Foo
      include CubeRegexp
    end
    
    @foo = Foo.new
    @string = "hallo_du_da"
  end

  it "replace strings" do
    
    erg = "hallo_12_da"
    
    @foo.replace_special_chars(@string,[:replace => {:char => "du", :with => "12"}]).should == erg
  end
  
  it "should replace strings with with given array hash replacements" do
    erg = "hallo_12_14"
    
    opt = [] << {:replace=>{:char=>"du",:with => "12"}} << {:replace => {:char =>"da", :with => "14"}}
    
    @foo.replace_special_chars(@string,opt).should == erg
  end
end

