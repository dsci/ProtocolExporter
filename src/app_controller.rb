# 
# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'xml_reader'

class AppController
  attr_accessor :filename,:excel
  attr_reader :druck_prot
  
  def initialize
    @file_Df = AppHelper.df_protokoll_location
    @file_Wu = AppHelper.wu_protokoll_location
    @file_Spz= AppHelper.spz_protokoll_location
    initExcelServer
    #@reader = XmlReader.new
  end
  
  def get_xml_object(opt ={})
    unless opt.empty?
      klass = opt[:klass] if opt.has_key?(:klass)
      xml = opt[:xml] if opt.has_key?(:xml)
      prot =opt[:prot] if opt.has_key?(:prot)
      
      parser = XML::XMLReader.new(xml,klass.new,prot.new)
      parser.parse
      parser.protocols
    end
  end
  
  
  #
  # parses access2007 xml report 
  # opt is a hash like that:
  # :xml => {:xml_content => :foo_file,:klass => OldCube}
  def get_xml_object_access(xml,opt={})
    unless opt.empty?
      #p opt
      #p opt[:xml][:klass]
      xml = opt[:xml][:xml_content] if opt[:xml].has_key?(:xml_content)
      klass = opt[:xml][:klass] if opt[:xml].has_key?(:klass)
      
    end
  end
  
  alias_method :readXmlFile, :get_xml_object
  alias_method :readWuXMLFile, :get_xml_object
  
  def exportDruckToExcel
    #file = "C:\\Documents and Settings\\daniel_schmidt\\Work\\Bilfinger\\excel\\df_protokoll.xls"
    @excel.druck_export(@file_Df,@druck_prot)
  end
  
  #def exportExcelDruckFromString(xml)
   # reader = XMLStuff.new
#    @druck_prot = reader.readDfXMLFromString(xml)
    #puts "File: #{@file_Df}"
    #file = "C:\\Documents and Settings\\daniel_schmidt\\Work\\Bilfinger\\excel\\df_protokoll.xls"
  #  initExcelServer if @excel.nil?
   # @excel.druck_export(@file_Df,@druck_prot)
  #end

  #  
  #def exportWuFromStringToExcel(xml)
   # reader = XMLStuff.new
  #  @wu_prot = reader.readWuXMLFromString(xml)
  #  initExcelServer if @excel.nil?
   # @excel.wu_export(@file_Wu,@wu_prot)
  #end
  
  
  
  
  #
  # opt is hash with classes 
  #
  def export_to_excel(opt = {})
    initExcelServer if @excel.nil?
    klass = opt[:klass] if opt.has_key?(:klass)
    # xml object bestimmen
    @excel.wu_export(@file_Wu,get_xml_object({:xml => opt[:xml],:klass=>opt[:klass],:prot => WuProtocol})) if klass.eql?(WuCube)
    @excel.druck_export(@file_Df,get_xml_object({:xml => opt[:xml],:klass=>opt[:klass],:prot => DruckProtokoll})) if klass.eql?(DfCube)
  rescue ArgumentError => ae
    
  end
  
  alias_method :exportExcelDruckFromString, :export_to_excel
  alias_method :exportWuFromStringToExcel,:export_to_excel
  
  #
  # exportiert access report xml ins excel
  # opt ist ein hash mit dem xml string und der klasse sowie der Art (WU/Df)
  def export_access_report(opt={})
    
    klass = opt[:klass] if opt.has_key?(:klass)
     #@excel.access_export(@file_Df, get_xml_object_access({:xml => {:xml_content => opt[:xml],:klass => klass}}))
    parser = XML::AccessXml.new(opt[:xml],klass.new)
    parser.parse(opt[:xml])
    xml_obj = parser.protocols
    
    @excel.access_export(@file_Df, xml_obj)
      #get_xml_object_access(opt[:xml],{:xml => {:xml_content => opt[:xml],:klass => klass}}))
    p xml_obj.size
  end
  
  #
  #
  #
  #
  def exportSpaltzug(spzProt)
    initExcelServer if @excel.nil?
    @excel.exportSpaltzug(@file_Spz,spzProt)
  end
  
  private 
  def initExcelServer
    @excel = ExcelExporter.new
  end
end