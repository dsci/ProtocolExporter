# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class ExcToolBar < ToolBar
  def initialize(eventm,parent=nil)
    super(parent)
    @eventM = eventm
    init
  end
  
  #initialisiert die Toolbar
  def init
    initActions
    addAction(@prf_export)
    #addSeparator()
    addAction(@spaltzug)
    addSeparator()
    addAction(@quitApp)
    signalsAndSlots
  end
  
  private
  
  def initActions
    @prf_export = createAction("images/preferences-certificates.png","Pruefzeugnis exportieren")
    @spaltzug = createAction("images/preferences-composer.png","Spaltzug exportieren")
    @quitApp = createAction("images/application-exit.png","Beenden")
  end
  
  def createAction(image,text)
    return Action.new(Icon.new(image),text,self)
  end
  
  def signalsAndSlots
    connect(@spaltzug,SIGNAL("triggered()"),@eventM,SLOT("spaltzug_neu()"))
    connect(@prf_export,SIGNAL("triggered()"),@eventM,SLOT("prfExport_neu()"))
    connect(@quitApp,SIGNAL("triggered()"),$qApp,SLOT('quit()'))
  end
end
