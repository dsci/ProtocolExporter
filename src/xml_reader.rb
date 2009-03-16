module XML
  
  module Shared
    
    protected
    def assign_klasses_from_xml(l_root,m_root)
     
      
      cube_fields = @cube.class.fields unless m_root.nil? #oracle db
      protocol_fields = @protocol.class.fields unless m_root.nil? # oracle db
      protocol_fields = @cube.class.fields if m_root.nil? #access
      
      #p "fields :#{protocol_fields}"
      #p "fff: #{l_root}"
      cubes = [] #wuerfel
      @protocols = [] #unless m_root.nil?
      #protokolle
      
      #p @xml_doc
      
      (@xml_doc/l_root).each do |xml|
        # hier protokolle
        protocol = Protocol.new unless m_root.nil?
        protocol = OldCube.new if m_root.nil?
        # 
        
        
        protocol_fields.each_with_index do |field,index|
          #p xml
          #p (xml/field.downcase_and_sym).text
          #p index 
          #p (xml/field)
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
      
      #p @protocols.size
      
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
    
    def parse(xml)
      root_string = "Abfrage_x003A__x0020_Protokoll_x0020_Wuerfel_x0020_komplett"
      
      
      
      #@xml.gsub!(Regexp.new(root_String),"Protokoll")
     
        
      
      @xml = replace_special_chars(@xml,[
                                        {:replace => {:char => "\344", :with => "ae" }},
                                        {:replace => {:char => "\374", :with => "ue"}},
                                        {:replace => {:char => "\366", :with => "oe"}},
                                        {:replace => {:char => "\337", :with => "ss"}},
                                        {:replace => {:char => root_string,:with => "Protokoll"}},
                                        {:replace => {:char => "Soll-Pruefalter", :with => "soll_pruefalter"}},
                                        {:replace => {:char => "_x0020_",:with => "_"}},
                                        {:replace => {:char => "Lieferschein-Nr", :with=> "lieferschein_nr"}}
                                        #{:replace => {:char => "_?[x0-9*]*", :with =>"" }}
                                      ])
      #p @xml      
      
      @xml_doc = Hpricot.parse(@xml)
      l_root = "Protokoll".downcase_and_sym
      assign_klasses_from_xml(l_root,nil)
    end
    
    private 
    def assign_klasses_from_report
      cube_fields = @cube.class.fields
      xml = @xml_doc.search("//")
      
    end
  end
end