# 
# To change this template, choose Tools | Templates
# and open the template in the editor.


include Qt

class EventManager < Qt::Object
  attr_reader :controller
  
  
  slots 'runBtnAction()','loadBtnAction()','wu_protChanged(int)','df_protChanged(int)','spaltzug_neu()',
        'prfExport_neu()','spaltzugAdd()','spaltZugExport()','info()','wu_old_changed(int)','df_old_changed(int)'
  
  def initialize(view = nil)
    super()
    @view = view
    @controller = AppController.new()
    #puts "init"
  end
  
  def loadBtnAction()
    @view.is_file = true
    fname = Qt::FileDialog.getOpenFileName( @view, "XML Datei fuer Export", '.', "*.xml" )
    @controller.filename = fname
    if @view.isDF
        @controller.readXmlFile
    else
        @controller.readWuXMLFile
    end
  rescue
    
  end
  
  def runBtnAction()
    #puts @view.isWU + "/" + @view.isDF
    # protokollart ausgewaehlt ?
    xml = @view.xml_edit.plainText
    if (@view.isWU and @view.isDF) and (@view.isDf_old and @view.isWu_old) 
      #messagebox anzeigen
      #MessageBox::information(tr("foo"),tr("bar"))
      #puts "todod"
    else
      if @view.isDF
            #druck protokoll
            #datei geladen ? wenn ja, gleich export
            #datei nicht geladen, xml aus textedit lesen und parsen
            if @view.is_file
                # nothing to do here yet
                #@controller.exportDruckToExcel
            else
                unless @view.xml_edit.plainText.empty?
                    @controller.exportExcelDruckFromString({:xml => xml, :klass=>DfCube})
                end
            end   
      elsif(@view.isWU)
            #wu protokoll
            if @view.is_file
              #nothing to do here yet
              #@controller.exportWuToExcel
            else
              unless @view.xml_edit.plainText.empty?
                @controller.exportWuFromStringToExcel({:xml => xml, :klass => WuCube})
              end
            end
      elsif(@view.isDf_old)
          unless @view.xml_edit.plainText.empty?
            #puts @view.xml_edit.plainText
            @controller.export_access_report({:xml => @view.xml_edit.plainText, :klass => OldCube})
          end
      end
    
      reset_elements(:excel => nil)
    end
    #rescue Exception => e
    #MessageBox anzeigen
    #puts e.message
    #Qt::MessageBox::critical(@view,"Fehler","Fehler beim Auslesen des Zeugnisses!\n Bitte nachkontrollieren.\n #{e.message}",Qt::MessageBox::Ok,Qt::MessageBox::NoButton)
  end
  
  def wu_protChanged(int)
    if int.eql?(2)
      @view.isWU = true
      @view.isDF = false 
    elsif(int.eql?(0))
      @view.isWU = false
      @view.isDF = true
    end
  end
  
  def df_protChanged(int)
    if(int.eql?(2))
      @view.isWU = false
      @view.isDF = true
    elsif(int.eql?(0))
      @view.isDF = false
      @view.isWU = true
    end
  end
  
  def wu_old_changed(int)
    if(int.eql(2))
      @view.isWU = false
      @view.isDF = false
      @view.isWu_old = true
      @view.isDf_old = false
    elsif(int.eql?(0))  
      @view.isWU = true
      @view.isDF = true
      @view.isWu_old = false
      @view.isDf_old = true
    end
  end
  
  def df_old_changed(int)
    if(int.eql?(2))
      @view.isWU = false
      @view.isDF = false
      @view.isWu_old = false
      @view.isDf_old = true
    elsif(int.eql?(0))  
      @view.isWU = true
      @view.isDF = true
      @view.isWu_old = true
      @view.isDf_old = false
    end
  end
  
  def spaltzug_neu()
    @view.centralWidget = Spaltzug_Wind.new(self,@view)
    
  end
  
  
  #
  # Event fuer Toolbar Button "pruefexport neu"
  #
  def prfExport_neu()
    @view.centralWidget = PrfExpWindow.new(self,@view)
    reset_elements(:excel => nil)
  end
  
  def spaltzugAdd()
    #puts AppHelper.spaltzugArray
    #puts AppHelper.spaltzugNeu()
    view = @view.centralWidget
    AppHelper.spaltzugArray << fillSpaltzugModel(view)
    #puts AppHelper.spaltzugArray.size
    view.clearUI
  end
  
  def spaltZugExport()
    spzProt = SpaltzugProtokoll.new
    view = @view.centralWidget
    spzProt.baustelle = view.spzUI.baustelleEdit.text
    spzProt.firma = view.spzUI.firmaEdit.text
    spzProt.tbwerk = view.spzUI.lieferwerkEdit.text
    #if AppHelper.spaltzugArray.empty?
      # momentan eingetragene Daten einzigstes Element 
      # Model erstellen
      # Array hinzuefuegen
      #puts "empty"
      AppHelper.spaltzugArray << fillSpaltzugModel(view)
    #end
    spzProt.spaltzug = AppHelper.spaltzugArray
    #puts spzProt.spaltzug.size
    @controller.exportSpaltzug(spzProt)
  end
  
  def info()
    km = AboutWindowClass.new(@view)
    
    km.visible=true
  end
  
  private 
  def fillSpaltzugModel(view)
    spzUI = view.spzUI
    model = Spaltzug.new
    
    model.nr = spzUI.pkNrEdit.text
    model.lieferschein = spzUI.lieferscheinEdit.text
    model.bauteil = spzUI.bauteilEdit.text
    model.herstelldatum = spzUI.hstDatumEdit.text
    model.ausbreit = spzUI.ausbreitEdit.text
    model.einlief_dat = spzUI.einliefDatEdit.text
    model.eb_flaech = spzUI.ebenflEdit.text
    model.alter_ist = spzUI.istalterEdit.text
    model.prf_datum = spzUI.prfDatEdit.text
    model.laenge = spzUI.lengthEdit.text
    model.breite = spzUI.widthEdit.text
    model.hoehe =spzUI.heightEdit.text
    model.masse =spzUI.weightEdit.text
    model.rohdichteF = spzUI.rohEdit.text
    model.bruchlast = spzUI.lineEdit_33.text
    model.buch_nr = spzUI.prfBNrEdit.text
    model.betonkl = spzUI.betonFestBox.itemText(spzUI.betonFestBox.currentIndex)
    model.betonsorte = spzUI.betonsorteEdit.text
    model.sollalterm = spzUI.sollAlterBox.itemText(spzUI.sollAlterBox.currentIndex)
    model.betontemp = spzUI.betontempEdit.text
    model.verdichtm = spzUI.verdichtmassEdit.text
    model.verdichtger = spzUI.verdichtTypEdit.text
    model.verdichtdauer = spzUI.verdichtDauerEdit.text
    model.masseFB = spzUI.masseFBEdit.text
    #model.masseF = spzUI.mass
    model.annehmer = spzUI.annehmEdit.text
    model.lagerungWB = spzUI.lagerWEdit.text
    model.lagerungLB = spzUI.lagerLEdit.text
    model.lagerungLF =spzUI.lagerungLEdit.text
    model.lagerungWF = spzUI.lagerungWEdit.text
    model.volumeF = spzUI.volumenEdit.text
    model.rohdichteF = spzUI.rohEdit.text
    model.luftgehalt = spzUI.luftgehaltEdit.text
    model.lufttemp = spzUI.lufttempEdit.text
    
    return model
  end
  
  #
  # resets neccessary gui elements and - if given - the excel server
  #
  def reset_elements(*args)
    excel = args.first 
    if excel 
      state = excel.stringify_keys
      @controller.excel = state['excel'] unless @controller.excel.nil?
    end
    
    class << @view
      public :clear_text_edit
      public :clear_prot_status
    end
    
     # textfeld leeren
     @view.clear_text_edit
     @view.clear_prot_status
    
  end
end
