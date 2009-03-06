# 
# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'src/core_ext.rb'
require 'active_support'
require 'src/helper.rb'

describe Helper do
  before(:each) do
    
  end
  
  it "should cut off the Ebenflaechigkeit argument" do
    Helper.ebenflaechigkeit("Ohne Beanstandung").should == "o.B."
  end
  
  it "should be nil when Ebenflaechigkeit doesn't exists" do
    Helper.ebenflaechigkeit(nil).should == nil
  end
  
  it "should give an empty String when Ebenflaechigkeit is empty" do
    Helper.ebenflaechigkeit("").should == ""
  end
  
  it "should round correctly" do
    druckf = Helper.druckfestigkeit(150,150, 930)
    Helper.round(druckf*0.92,0.5).should == 38.0
  end
  
end