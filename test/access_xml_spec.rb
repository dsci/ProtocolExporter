# 
# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'src/cube_regexp'
require 'src/xml_reader'


describe XML::AccessXml do
  before(:each) do
    @access_xml = XML::AccessXml.new
  end

  it "should have a parse method" do
    @access_xml.methods.include?("parse").should == true
  end
end

