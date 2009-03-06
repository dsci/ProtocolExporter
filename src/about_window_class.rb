# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class AboutWindowClass<Dialog
  attr_reader :dlg
  def initialize(parent=nil)
    super(parent)
    init
  end
  
  private 
  def init
    setupUI
    #signalsAndSlots
  end
  
  def setupUI
    @dlg = Ui_Dialog.new
    @dlg.setupUi(self)
    self.windowTitle = tr("Hilfe und Informationen")
    #setHtmlText = 
    #setHtmlText="<b>jhsd</b>"
    @dlg.textEdit.setHtml(AppHelper.readInfo())
    @dlg.textEdit.readOnly=true
  end
  
  
  
  
end
