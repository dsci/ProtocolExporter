# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 
require 'old_cube'

describe OldCube do
  before(:each) do
    @old_cube = OldCube.new
  end

  it "should desc" do
    fields = @old_cube.class.fields
    
    fields.each do |f|
      k = f.downcase
      p "method missing #{k}" unless  @old_cube.methods.include?(k)
      @old_cube.methods.include?(k).should == true
    end
    
  end
end

