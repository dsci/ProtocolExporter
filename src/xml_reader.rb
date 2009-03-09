module XML
  
  module Shared
    
    protected
    def assign_klasses_from_xml(l_root,m_root)
     
      
      cube_fields = @cube.class.fields unless m_root.nil? #oracle db
      protocol_fields = @protocol.class.fields unless m_root.nil? # oracle db
      protocol_fields = @cube.class.fields if m_root.nil? #access
      
      cubes = [] #wuerfel
      @protocols = [] unless m_root.nil? #protokolle
      
      (@xml_doc/l_root).each do |xml|
        # hier protokolle
        protocol = Protocol.new unless m_root.nil?
        protocol = OldCube.new if m_root.nil?
        # 
        for field in protocol_fields
          p (xml/field.downcase_and_sym).text
          protocol.send("#{field.downcase_and_sym}=",(xml/field.downcase_and_sym).text)
        end
        
        unless m_root.nil?
          count = 0
          (xml/m_root).each do |sub_xml|
            cube = @cube.class.new 
            count += 1
            for field in cube_fields
              meth_name = field.downcase
              #p meth_name
              cube.send("#{field.downcase_and_sym}=",(sub_xml/field.downcase_and_sym).text)
            end
            cubes << cube
            protocol.cubes = cubes # alle wuerfel zum protocol
          end
        end
        @protocols << protocol # protokolle sammeln
      end
      
      p @protocols.last
      
    end # end assign_klasses
  end
  
  module FileWork
    
    class ReadFile
      
      # autor: Daniel Schmidt
      # Comment for method
      #  
      def self.read(file)
        lines = ""
        File.open(file) do |f|
          while line = f.gets
            lines << line  
          end
        end
        return lines
      rescue 
       lines 
      end
      
    end # end class
    
  end #end module file
  
  class Reader 
    attr_reader :xml,:cube,:protocol,:protocols
  end
  
  class XMLReader < Reader
    include XML::Shared
    # autor: Daniel Schmidt
    # Comment for method
    #  
    def initialize(xml=nil, cube=nil,protocol=nil)
#      @xml = xml[:assets] if xml.has_key?(:assets)
      @xml = xml
      @cube = cube
      #p @cube.class
      #p @cube.class.fields
      @protocol = protocol
      #p @protocol.class.fields
      #protocol[:protocol] if protocol.has_key?(:protocol)
    end
    
    # autor: Daniel Schmidt
    # Comment for method
    #  
    def parse
      @xml_doc = Hpricot.parse(@xml)
      assign_klasses_from_xml( "G_PRUEFZEUGNIS".downcase.to_sym,"G_PROBE".downcase_and_sym)
    end
    
    private
    
  end
  
  class AccessXml < Reader
    include CubeRegexp,XML::Shared
    
    def initialize(xml=nil, cube=nil,protocol=nil)
      @xml = xml
      @cube = cube
      @protocol = protocol
    end
    
    def parse
      root_String = "Abfrage_x003A__x0020_Protokoll_x0020_Würfel_x0020_komplett"
      xml = replace_special_chars(xml,[{:replace => {:char => "ä", :with => "ae" }},
                                        {:replace => {:char => "ü", :with => "ue"}},
                                        {:replace => {:char => "ö", :with => "oe"}},
                                      {:replace => {:char => root_String,:with => "Protokoll"}},
                                      {:replace => {:char => "_?[x0-9*]*", :with =>"" }}])
      @xmldoc = Hpricot.parse(xml)
      assign_klasses_from_xml("Protokoll".downcase_and_sym,nil)
    end
    
    private 
    def assign_klasses_from_report
      cube_fields = @cube.class.fields
      xml = @xml_doc.search("//")
      
    end
  end
end