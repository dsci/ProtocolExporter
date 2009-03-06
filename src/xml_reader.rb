module XML
  
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
      assign_klasses_from_xml
    end
    
    private
    def assign_klasses_from_xml
      l = "G_PRUEFZEUGNIS".downcase.to_sym
      m = "G_PROBE".downcase_and_sym
      
      cube_fields = @cube.class.fields
      protocol_fields = @protocol.class.fields
      
      cubes = [] #wuerfel
      @protocols = [] #protokolle
      
      (@xml_doc/l).each do |xml|
        # hier protokolle
        protocol = Protocol.new
        # 
        for field in protocol_fields
          p (xml/field.downcase_and_sym).text
          protocol.send("#{field.downcase_and_sym}=",(xml/field.downcase_and_sym).text)
        end
        
        count = 0
        (xml/m).each do |sub_xml|
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
        @protocols << protocol # protokolle sammeln
      end
      
    end # end assign_klasses
  end
  
  class AccessXml < Reader
    include CubeRegexp
    
    def initialize(xml=nil, cube=nil,protocol=nil)
      @xml = xml
      @cube = cube
      @protocol = protocol
    end
    
    def parse
      xml = replace_special_chars(xml,[{:replace => {:char => "ä", :with => "ae" }},
                                        {:replace => {:char => "ü", :with => "ue"}},
                                        {:replace => {:char => "ö", :with => "oe"}}])
      @xmldoc = Hpricot.parse(xml)
      assign_klasses_from_report
    end
    
    private 
    def assign_klasses_from_report
      
      xml = @xml_doc.search("//Abfrage")
      
    end
  end
end