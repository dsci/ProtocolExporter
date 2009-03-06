# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'rexml/document'
require 'src/xml_reader'
require 'src/protokoll.rb'
require 'src/druck_protokoll.rb'
require 'src/wu_protokoll.rb'
require 'src/general_cube.rb'
require 'src/cube.rb'
require 'src/df_cube.rb'
require 'src/wu_cube.rb'
require 'test/xml_reader_spechelper'

describe XMLStuff do
  before(:each) do
    @xml_reader = XMLStuff.new
  end
  
  def do_df_file
    file = "C:\\Documents and Settings\\Demo\\Desktop\\prfzg.xml"
    @xml_string = read_file(file)
  end
  
  def do_wu_file
    #file = "C:\\Documents and Settings\\Demo\\My Documents\\NetBeansProjects\\Cube\\xml\\wu_test.xml"
    file = "E:\\bad_salzungen.xml"
    @xml_string = read_file(file)
  end

  it "should have cubes more than or equal one" do
    do_df_file
    erg = 1
    hh = @xml_reader.readDfXMLFromString(@xml_string)
    hh.cubes.size.should == erg
  end
  
  it "should have wu cubes" do
    do_wu_file
    hh = @xml_reader.readWuXMLFromString(@xml_string)
    hh.cubes[0].class.should == WuCube
  end
  
  it "should not have empty wu cubes" do
    do_wu_file 
    hh = @xml_reader.readWuXMLFromString(@xml_string)
    hh.cubes.empty?.should_not be true
  end
  
  it "should be a element class" do
    do_wu_file
    hh = @xml_reader.readWuXMLFromString(@xml_string)
    hh.should be(REXML::Element)
  end

end

