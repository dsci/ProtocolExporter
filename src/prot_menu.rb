# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class ProtMenu<MenuBar
  def initialize(eventM,parent=nil)
    super(parent)
    @parent = parent
    @eventM = eventM
    init
  end
  
  private 
  
  def init
    createActions
    addMenus
    signalsAndSlots
  end
  
  def addMenus
    @fileMenu = self.addMenu(tr("&Datei"))
    @fileMenu.addAction(@festProt)
    @fileMenu.addAction(@spzZug)
    @fileMenu.addSeparator
    @fileMenu.addAction(@quit)
    @aboutMenu = self.addMenu(tr("&Ueber"))
    @aboutMenu.addAction(@aboutQt)
  end
  
  def createActions
    @festProt = Action.new(tr("&Neues Festigkeits/WU Protokoll"),self)
    @spzZug = Action.new(tr("Neues &Spaltzugprotokoll"),self)
    @quit = Action.new(tr("Beenden"),self)
    @aboutQt = Action.new(tr("Infos"),self)
  end
  
  def signalsAndSlots
    connect(@quit,SIGNAL("triggered()"),$qApp,SLOT('quit()'))
    connect(@aboutQt,SIGNAL("triggered()"),@eventM,SLOT('info()'))
    connect(@festProt,SIGNAL("triggered()"),@eventM,SLOT('prfExport_neu()'))
    connect(@spzZug,SIGNAL("triggered()"),@eventM,SLOT('spaltzug_neu()'))
  end
  
  
end
