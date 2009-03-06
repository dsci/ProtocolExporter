# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'spaltzug_ui.rb'

class Spaltzug_Wind < Widget
  attr_reader :spzUI
  
  def initialize(eventM,parent=nil)
    super(parent)
    @eventM = eventM
    
    init
  end
  
  def init
    setupUI
    signalsAndSlots
  end
  
  #
  # loescht Angaben aus der UI
  # belaesst typische Angaben
  #
  def clearUI
    num = @spzUI.pkNrEdit.text
    @spzUI.pkNrEdit.text = Helper.increaseNumber(num)
    emit @spzUI.lieferscheinEdit.clear
    emit @spzUI.lufttempEdit.clear
    emit @spzUI.betontempEdit.clear
    emit @spzUI.ausbreitEdit.clear
    emit @spzUI.verdichtmassEdit.clear
    emit @spzUI.masseFBEdit.clear
    emit @spzUI.volumenEdit.clear
    emit @spzUI.rohEdit.clear
    emit @spzUI.luftgehaltEdit.clear
    emit @spzUI.lagerWEdit.clear
    emit @spzUI.lagerungLEdit.clear
    @spzUI.prfBNrEdit.text = (@spzUI.prfBNrEdit.text.to_i + 1).to_s
    emit @spzUI.lagerungLEdit.clear
    emit @spzUI.lagerWEdit.clear
    emit @spzUI.ebenflEdit.clear
    emit @spzUI.lengthEdit.clear
    emit @spzUI.widthEdit.clear
    emit @spzUI.heightEdit.clear
    emit @spzUI.weightEdit.clear
    emit @spzUI.volumeEdit.clear
    emit @spzUI.rohFestEdit.clear
    emit @spzUI.lineEdit_33.clear
    emit @spzUI.prfDatEdit.clear
    
  end
  
  private
  def setupUI
    @spzUI = Ui_Form.new
    @spzUI.setupUi(self)
    #@spzUI.show
    #@spzUi.spaltzugAdd.setIcon = Icon.new("images/list-add.png")
    #puts @spzUI.spaltzugAdd.class
    @spzUI.spaltzugAdd.icon = Icon.new("images/list-add.png")
    @spzUI.spaltzugExport.icon = Icon.new("images/document-export.png")
    @spzUI.istalterEdit.enabled=false
    @spzUI.rohFestEdit.enabled = false
    #z.text = "hlll"
  end
  
  def signalsAndSlots
    connect(@spzUI.spaltzugAdd,SIGNAL("clicked()"),@eventM,SLOT("spaltzugAdd()"))
    connect(@spzUI.spaltzugExport,SIGNAL("clicked()"),@eventM,SLOT("spaltZugExport()"))
  end
end
