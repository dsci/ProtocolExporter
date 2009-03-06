require 'qt4'
include Qt

class MainView < MainWindow
    attr_accessor :is_file,:xml_edit,:isWU,:isDF
    attr_reader :xml_edit
    def initialize(parent = nil)
        super(parent)
        init()
        #quit = PushButton.new(self) do |q|
        #  q.text = tr("Quit")
        #  q.setGeometry(62, 40, 75, 30)
        #  q.setFont(Qt::Font.new('Times', 18, Qt::Font::Bold))
        #end
       
    end
    
    
    
    private
    def init()
      initEventManager()
      initToolBar
      initSpaltZug
      main = PrfExpWindow.new(@eventM,self)
      @is_file = false
      @isDF = main.isDF
      @isWU = main.isWU
      @isDf_old = main.isDf_old
      @isWu_old = main.isWu_old
      @xml_edit = main.xml_edit
      
      self.centralWidget = main
      self.setStatusBar(createStatusBar)
      self.menuBar = ProtMenu.new(@eventM,self)
      self.minimumSize = Size.new(800,600)
    end
    
    def initSpaltZug
      AppHelper.initSpaltZugArray
    end
    
    def initToolBar
      addToolBar(ExcToolBar.new(@eventM,self))
    end
    
    def initEventManager()
      @eventM = EventManager.new(self)
    end

    def createStatusBar
      return StatusBar.new do |s|
        s.addPermanentWidget(Label.new(tr("Protocol2Excel by Daniel Schmidt 2008")),5)
      end
    end
    
    def clear_text_edit
      emit @xml_edit.clear
    end
    
    #
    # resets the checkboxes
    #
    def clear_prot_status
      self.centralWidget.wu_prot.setCheckState(Qt::Unchecked)
      self.centralWidget.df_prot.check_state = Qt::Unchecked
    end
end
