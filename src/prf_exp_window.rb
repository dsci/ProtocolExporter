# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class PrfExpWindow < Widget
  
  attr_accessor :is_file,:isWU,:isDF, :wu_prot, :df_prot,:isDf_old, :isWu_old
  attr_reader :xml_edit
  
  def initialize(eventM,parent=nil)
    super(parent)
    @eventM = eventM
    init
  end
  
  def init
     @xml_edit = TextEdit.new(self)
     main = Widget.new
     w =initButtonBox
     checks = initCheckBox()
     hbox = VBoxLayout.new do |h|
        h.addWidget(Label.new(tr("Protokollzeugnis einfuegen:"),self))
        h.addWidget(@xml_edit)
        h.addWidget(checks)
        h.addWidget(w)
        h.setAlignment(w,Qt::AlignRight)
     end
     
     self.layout = hbox
     signalsAndSlots()
  end
  
  private
  def initButtonBox
      w = Widget.new
      @loadBtn = PushButton.new(Icon.new("images/document-open.png"),tr('Datei laden'),w)
      @runBtn = PushButton.new(Icon.new("images/document-export.png"),tr('nach Excel exportieren'),w)
   
      
      vbox = HBoxLayout.new do |v|
        v.addWidget(@loadBtn)
        v.addWidget(@runBtn)
   
      end
      
      w.layout = vbox
      return w
  end

  def initCheckBox()
      w = Widget.new
      @wu_prot = CheckBox.new(tr("WU Protokoll (Neue Db)"),w)
      @df_prot = CheckBox.new(tr("Druck Protokoll (Neue Db)"),w)
      
      @wu_prot_old = CheckBox.new(tr("Wu Protokoll (Alte Db)"),w)
      @df_prot_old = CheckBox.new(tr("Druck Protokoll (Alte Db)"),w)
    
      hbox = HBoxLayout.new do |h|
        h.addWidget(@wu_prot)
        
        h.addWidget(@df_prot)
        
        h.addWidget(@wu_prot_old)
        h.addWidget(@df_prot_old)
        
        h.setAlignment(@df_prot,Qt::AlignLeft)
      end
      
      w.layout = hbox
      return w
  end
  
  def signalsAndSlots()
       connect(@loadBtn,SIGNAL('clicked()'),@eventM,SLOT('loadBtnAction()'))
       #connect(@loadBtn, SIGNAL('clicked()'), $qApp, SLOT('quit()'))
       connect(@runBtn,SIGNAL('clicked()'),@eventM,SLOT('runBtnAction()'))
       connect(@wu_prot,SIGNAL('stateChanged(int)'),@eventM,SLOT('wu_protChanged(int)'))
       connect(@df_prot,SIGNAL('stateChanged(int)'),@eventM,SLOT('df_protChanged(int)'))
       connect(@wu_prot_old,SIGNAL('stateChanged(int)'),@eventM, SLOT('wu_old_changed(int)'))
       connect(@df_prot_old,SIGNAL('stateChanged(int)'),@eventM,SLOT('df_old_changed(int)'))
    end
end
