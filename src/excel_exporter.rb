# Author: Daniel Schmidt <demo.code@gmail.com>
# 
# To change this template, choose Tools | Templates
# and open the template in the editor.


class ExcelExporter
  
  # excel table letters
  DF_EX_RANGES = ["d","e","f","g"]
  WU_EX_RANGES = ["d","g","j"]
  
  def initialize
    @excel = WIN32OLE::new('excel.Application')
    
  end
  
  def export_df_to_excel(filename,protocols)
    #toggle_excel=false
    ex_ranges = ExcelExporter::DF_EX_RANGES
    book = @excel.WorkBooks.Open(filename)
    sheet = book.Worksheets(1)
    sheet.select
    
    report = protocols.last
    
    # protocol head
    #==========================================
    @excel.Range('g2')['Value'] = report.hersteller
    @excel.Range('d4')['Value'] = report.aug_name1
    @excel.Range('d5')['Value'] = report.baust
    @excel.Range('i5')['Value'] = report.prf_zg_nr
    #==========================================
    # end protocol head
    
    
    
    korr = Helper.toDouble(report.korr_fakt)
    #p "#{report.prod_bez}"
    
    #iterate over cubes
    report.cubes.each_with_index do |cube,count|
      unless count.eql?(ex_ranges.size)
        
        # use some helper stuff
        volumen = Helper.volume(cube.laenge_i,cube.breite_i,cube.hoehe_i)
        rohdichte = Helper.rohdichte(cube.masse, volumen)
        #puts "#{cube.laenge_i}, #{cube.breite_i}, #{cube.bruchlast}"
        druckfest = Helper.druckfestigkeit(cube.laenge_i, cube.breite_i, cube.bruchlast)
        #puts "druckfest is: #{druckfest}"
        druckfest_korr = Helper.round(druckfest * korr,0.5)
        #write data to excel here
        @excel.Range("#{ex_ranges[count]}7")['Value'] = cube.prb_nr
        #@excel.Range(ex_ranges[count].to_s<<'8')['Value'] = xml.festkl.to_s
        #@excel.Range('d8')['Value'] = xml.festkl
        @excel.Range("#{ex_ranges[count]}8")['Value'] = report.fest_kl
        @excel.Range("#{ex_ranges[count]}9")['Value'] = report.prod_bez
        @excel.Range("#{ex_ranges[count]}10")['Value'] = cube.lief_nr
        @excel.Range("#{ex_ranges[count]}11")['Value'] = cube.hst_dat
        exrange_insert(ex_ranges,count,12,cube.entna_horiz)
        #@excel.Range(ex_ranges[count].to_s<<'12')['Value'] = x.bauteil
        #exrange_insert(ex_ranges,count,15,x.herstelldatum)
        exrange_insert(ex_ranges,count,16,cube.luf_tp_i)
        exrange_insert(ex_ranges,count,17,cube.for_tp_i)
        exrange_insert(ex_ranges,count,18,cube.ausbr_mass)
        exrange_insert(ex_ranges,count,31,cube.prb_nr)
        exrange_insert(ex_ranges,count,33,cube.einlief_dat)
        exrange_insert(ex_ranges,count,37,cube.prf_dat)
        exrange_insert(ex_ranges,count,38,cube.prf_alt_i)
        exrange_insert(ex_ranges,count,39,Helper.ebenflaechigkeit(cube.eb_flaech))
        exrange_insert(ex_ranges,count,40,cube.laenge)
        exrange_insert(ex_ranges,count,41,cube.breite)
        exrange_insert(ex_ranges,count,42,cube.hoehe)
        exrange_insert(ex_ranges,count,43,cube.masse)
        exrange_insert(ex_ranges,count,44,volumen)
        exrange_insert(ex_ranges,count,45,rohdichte)
        exrange_insert(ex_ranges,count,46,cube.bruchlast)
        exrange_insert(ex_ranges,count,47,druckfest)
        exrange_insert(ex_ranges,count,48,druckfest_korr)
      else
        break
      end
    end
    
    #toggle_excel=true
    @excel.visible = true
  rescue WIN32OLERuntimeError => e
    Qt::MessageBox::critical(@view,"Fehler","Excel meint:\n #{e.message}",Qt::MessageBox::Ok,Qt::MessageBox::NoButton)
  end
  
  alias_method :druck_export, :export_df_to_excel
  
  #depricated
  def druck_exports(filename,xml)
    #pp xml
    File.open("xml_dump.yml", 'w') do |out|
      YAML.dump(xml, out)
    end
    ex_ranges = ["d","e","f","g"]
    book = @excel.WorkBooks.Open(filename)
    sheet = book.Worksheets(1)
    sheet.select
    #puts xml.class
    @excel['visible'] = false
    @excel.Range('g2')['Value'] = xml.tbwerk
    @excel.Range('d4')['Value'] = xml.firma
    @excel.Range('d5')['Value'] = xml.baustelle
    @excel.Range('i5')['Value'] = xml.nr
    
    korr = Helper.toDouble(xml.korr_fac)
    #puts "Size:#{xml.cubes.size}"
    #count = 0
    #for x in xml.cubes do
    xml.cubes.each_with_index do |x, count|
      unless count.eql?(ex_ranges.size)
        volumen = Helper.volume(x.laenge,x.breite,x.hoehe)
        rohdichte = Helper.rohdichte(x.masse, volumen)
        druckfest = Helper.druckfestigkeit(x.laenge, x.breite, x.bruchlast)
        druckfest_korr = Helper.round(druckfest * korr,0.5)
        #k = ex_ranges[count].to_s << '7'
        #puts k.class
        @excel.Range("#{ex_ranges[count]}7")['Value'] = x.nr
        #@excel.Range(ex_ranges[count].to_s<<'8')['Value'] = xml.festkl.to_s
        #@excel.Range('d8')['Value'] = xml.festkl
        @excel.Range("#{ex_ranges[count]}8")['Value'] = xml.festkl
        @excel.Range("#{ex_ranges[count]}9")['Value'] = xml.betonsorte
        @excel.Range("#{ex_ranges[count]}10")['Value'] = x.lieferschein
        @excel.Range("#{ex_ranges[count]}11")['Value'] = x.herstelldatum
        exrange_insert(ex_ranges,count,12,x.bauteil)
        #@excel.Range(ex_ranges[count].to_s<<'12')['Value'] = x.bauteil
        #exrange_insert(ex_ranges,count,15,x.herstelldatum)
        exrange_insert(ex_ranges,count,16,x.luf_tp_i)
        exrange_insert(ex_ranges,count,17,x.for_top_i)
        exrange_insert(ex_ranges,count,18,x.ausbreit)
        exrange_insert(ex_ranges,count,31,x.nr)
        exrange_insert(ex_ranges,count,33,x.einlief_dat)
        exrange_insert(ex_ranges,count,37,x.prf_datum)
        exrange_insert(ex_ranges,count,38,x.alter_ist)
        exrange_insert(ex_ranges,count,39,Helper.ebenflaechigkeit(x.eb_flaech))
        exrange_insert(ex_ranges,count,40,x.laenge)
        exrange_insert(ex_ranges,count,41,x.breite)
        exrange_insert(ex_ranges,count,42,x.hoehe)
        exrange_insert(ex_ranges,count,43,x.masse)
        exrange_insert(ex_ranges,count,44,volumen)
        exrange_insert(ex_ranges,count,45,rohdichte)
        exrange_insert(ex_ranges,count,46,x.bruchlast)
        exrange_insert(ex_ranges,count,47,druckfest)
        exrange_insert(ex_ranges,count,48,druckfest_korr)
        #count +=1
      else
        break
      end
    end
    toggle_excel = true
    # Einfuegen der XML Elemente in aktuelles Worksheet
  rescue WIN32OLERuntimeError => e
    Qt::MessageBox::critical(@view,"Fehler","Excel meint:\n #{e.message}",Qt::MessageBox::Ok,Qt::MessageBox::NoButton)
  end
  
  def export_wu_to_excel(filename,protocols)
    p "#{filename}"
    book = @excel.WorkBooks.Open(filename)
    sheet = book.Worksheets(1)
    sheet.select
    
    @excel.visible=false
    
    report = protocols.last
    
    # protocol head
    #==========================================
    @excel.Range('b2')['Value'] = report.hersteller
    @excel.Range('b4')['Value'] = report.aug_name1
    @excel.Range('b3')['Value'] = report.baust
    @excel.Range('i3')['Value'] = report.prf_zg_nr
    #==========================================
    # end protocol head
    
    ex_ranges = ExcelExporter::WU_EX_RANGES
    
    report.cubes.each_with_index do |cube,count|
      unless count.eql?(ex_ranges.size)
        exrange_insert(ex_ranges,count,7,cube.prb_nr)
        exrange_insert(ex_ranges,count,8,report.prod_bez)
        exrange_insert(ex_ranges,count,9,report.fest_kl)
        exrange_insert(ex_ranges,count,10,cube.ausbr_mass)
        exrange_insert(ex_ranges,count,12,cube.lief_nr)
        exrange_insert(ex_ranges,count,13,cube.entna_horiz)
        exrange_insert(ex_ranges,count,14,cube.hst_dat)
        exrange_insert(ex_ranges,count,17,"28")
        @excel.Range('c25')['Value'] = cube.einlief_dat
        exrange_insert(ex_ranges,count,28,cube.prb_nr)
        exrange_insert(ex_ranges,count,31,cube.prf_dat)
        exrange_insert(ex_ranges,count,32,cube.prf_alt_i)
        exrange_insert(ex_ranges,count,33,"#{cube.laenge_i}x#{cube.breite_i}x#{cube.hoehe_i}")
        exrange_insert(ex_ranges,count,40,cube.max_wadriti)
      else
        break
      end
    end
    
    @excel.visible = true
  #rescue WIN32OLERuntimeError => e
   # Qt::MessageBox::critical(@view,"Fehler","Excel meint:\n #{e.message}",Qt::MessageBox::Ok,Qt::MessageBox::NoButton)
  end
  
  alias_method :wu_export, :export_wu_to_excel
  
  
  # exports access reports to excel
  #
  #
  def access_export(filename,protocols)
    
    file_path = "protocols.yml"
    File.open(file_path, "w") { |file| YAML.dump(protocols, file) }
    
    ex_ranges = ExcelExporter::DF_EX_RANGES
    book = @excel.WorkBooks.Open(filename)
    sheet = book.Worksheets(1)
    sheet.select
    
    report = protocols.last
    
    # protocol head
    #==========================================
    @excel.Range('g2')['Value'] = report.betonwerk
    @excel.Range('d4')['Value'] = report.auftraggebende_nl
    @excel.Range('d5')['Value'] = report.baustellenbezeichnung
    @excel.Range('i5')['Value'] = report.protokollnummer
    #==========================================
    # end protocol head
    
    
    
    korr = Helper.toDouble(report.korr_fakt)
    
    protocols.each_with_index do |cube,count|
      unless count.eql?(ex_ranges.size)
        # use some helper stuff
        #p "#{cube.laenge},#{cube.breite},#{cube.hoehe}"
        volumen = Helper.volume(cube.laenge,cube.breite,cube.hoehe)
        rohdichte = Helper.rohdichte(cube.masse, volumen)
        #puts "#{cube.laenge_i}, #{cube.breite_i}, #{cube.bruchlast}"
        druckfest = Helper.druckfestigkeit(cube.laenge, cube.breite, cube.bruchlast)
        #puts "druckfest is: #{druckfest}"
        #p druckfest 
        
        #p cube.soll_pruefalter
        
        druckfest_korr = Helper.round(druckfest * korr,0.5)
        #write data to excel here
        @excel.Range("#{ex_ranges[count]}7")['Value'] = cube.pk
        #@excel.Range(ex_ranges[count].to_s<<'8')['Value'] = xml.festkl.to_s
        #@excel.Range('d8')['Value'] = xml.festkl
        @excel.Range("#{ex_ranges[count]}8")['Value'] = cube.betonfestigkeitsklasse
        @excel.Range("#{ex_ranges[count]}9")['Value'] = cube.betonsorte
        @excel.Range("#{ex_ranges[count]}10")['Value'] = cube.lieferschein_nr
        @excel.Range("#{ex_ranges[count]}11")['Value'] = cube.herstell_datum
        exrange_insert(ex_ranges,count,12,cube.bauteil)
        #@excel.Range(ex_ranges[count].to_s<<'12')['Value'] = x.bauteil
        exrange_insert(ex_ranges,count,15,cube.soll_pruefalter)
        exrange_insert(ex_ranges,count,16,cube.lufttemperatur)
        exrange_insert(ex_ranges,count,17,cube.frischbetontemperatur)
        exrange_insert(ex_ranges,count,18,cube.ausbreit)
        exrange_insert(ex_ranges,count,31,cube.pruefnummer)
        exrange_insert(ex_ranges,count,32,cube.pruefbuch_nummer)
        exrange_insert(ex_ranges,count,34,cube.kurzzeichen)
        exrange_insert(ex_ranges,count,33,cube.einlieferungs_datum)
        exrange_insert(ex_ranges,count,35,cube.lagerung_in_wasser)
        exrange_insert(ex_ranges,count,36,cube.lagerung_in_luft_labor)
        exrange_insert(ex_ranges,count,37,cube.prfdatum)
        exrange_insert(ex_ranges,count,38,cube.ist_alter)
        exrange_insert(ex_ranges,count,39,cube.aeussere_beschaffenheit)
        exrange_insert(ex_ranges,count,40,cube.laenge)
        exrange_insert(ex_ranges,count,41,cube.breite)
        exrange_insert(ex_ranges,count,42,cube.hoehe)
        exrange_insert(ex_ranges,count,43,cube.masse)
        exrange_insert(ex_ranges,count,44,volumen)
        exrange_insert(ex_ranges,count,45,rohdichte)
        exrange_insert(ex_ranges,count,46,cube.bruchlast)
        exrange_insert(ex_ranges,count,47,druckfest)
        exrange_insert(ex_ranges,count,48,druckfest_korr)
      else
        break
      end
    end
    
    @excel.visible = true
  end
  
  #depricated
  def wu_exports(filename,xml)
    ex_ranges = ["d","g","j"] 
    num_range = ["d","g","j"]
    book = @excel.WorkBooks.Open(filename)
    sheet = book.Worksheets(1)
    sheet.select
    @excel['visible'] = false
    @excel.Range('b4')['Value'] = xml.firma
    @excel.Range('b3')['Value'] = xml.baustelle
    @excel.Range('j3')['Value'] = xml.nr
    #count = 0 
    #puts "WU Size: #{xml.cubes.size}"
    #for x in xml.cubes do
    xml.cubes.each_with_index do |x, count|    
      unless count.eql?(3)
        #puts "Nummer:#{x.nr}"
        @excel.Range("#{num_range[count]}7")['Value'] = x.nr
      #@excel.Range("#{num_range[count]}")
        exrange_insert(ex_ranges,count,8,xml.betonsorte)
        exrange_insert(ex_ranges,count,9,xml.festkl)
        exrange_insert(ex_ranges,count,10,x.ausbreit)
        exrange_insert(ex_ranges,count,12,x.lieferschein)
        exrange_insert(ex_ranges,count,13,x.bauteil)
        exrange_insert(num_range,count,14,x.herstelldatum)
        exrange_insert(ex_ranges,count,17,"28")
        @excel.Range('c25')['Value'] = cube.einlief_dat
        exrange_insert(ex_ranges,count,28,cube.prb_nr)
        exrange_insert(num_range,count,31,cube.prf_datum)
        exrange_insert(ex_ranges,count,32,cube.alter_ist)
        exrange_insert(num_range,count,33,"#{cube.laenge}x#{x.breite}x#{x.hoehe}")
        exrange_insert(ex_ranges,count,40,x.eindringtiefe)
        #count += 1
      else
        break
      end
    end
    @excel.visible = true
  end
  
  def exportSpaltzug(filename,spzProt)
    ex_ranges = ["d","e","f"]
    book = @excel.WorkBooks.Open(filename)
    sheet = book.WorkSheets(1)
    sheet.select
    @excel.visible = false
    @excel.Range('g2')['Value'] = spzProt.tbwerk
    @excel.Range('d4')['Value'] = spzProt.firma
    @excel.Range('d5')['Value'] = spzProt.baustelle
    
    count = 0
    spzProt.spaltzug.each{|n|
      volumen = Helper.volume(n.laenge,n.breite,n.hoehe)
      rohdichte = Helper.rohdichte(n.masse, volumen)
      alter = Helper.pruefalter(Helper.format_date(n.herstelldatum), Helper.format_date(n.prf_datum))
      round = Helper.round(Helper.spaltzug_fest(n.bruchlast,n.breite,n.hoehe))
      exrange_insert(ex_ranges,count,7,n.nr)
      exrange_insert(ex_ranges,count,8,n.betonkl)
      exrange_insert(ex_ranges,count,9,n.betonsorte)
      exrange_insert(ex_ranges,count,10,n.lieferschein)
      exrange_insert(ex_ranges,count,11,n.herstelldatum)
      exrange_insert(ex_ranges,count,12,n.bauteil)
      exrange_insert(ex_ranges,count,15,n.sollalterm)
      exrange_insert(ex_ranges,count,16,n.lufttemp)
      exrange_insert(ex_ranges,count,17,n.betontemp)
      exrange_insert(ex_ranges,count,18,n.ausbreit)
      exrange_insert(ex_ranges,count,19,n.verdichtm)
      exrange_insert(ex_ranges,count,20,n.verdichtger)
      exrange_insert(ex_ranges,count,21,n.verdichtdauer)
      exrange_insert(ex_ranges,count,22,n.masseFB)
      exrange_insert(ex_ranges,count,23,n.masseF)
      exrange_insert(ex_ranges,count,24,n.massB)
      exrange_insert(ex_ranges,count,25,n.volumeF)
      #exrange_insert(ex_ranges,count,26.n.rohdichteF)
      exrange_insert(ex_ranges,count,27,n.luftgehalt)
      exrange_insert(ex_ranges,count,28,n.lagerungWF)
      exrange_insert(ex_ranges,count,29,n.lagerungLF)
      exrange_insert(ex_ranges,count,32,n.buch_nr)
      exrange_insert(ex_ranges,count,33,n.einlief_dat)
      exrange_insert(ex_ranges,count,34,n.annehmer)
      exrange_insert(ex_ranges,count,35,n.lagerungWB)
      exrange_insert(ex_ranges,count,36,n.lagerungLB)
      exrange_insert(ex_ranges,count,37,n.prf_datum)
      exrange_insert(ex_ranges,count,38,alter)
      exrange_insert(ex_ranges,count,39,n.eb_flaech)
      exrange_insert(ex_ranges,count,40,n.laenge)
      exrange_insert(ex_ranges,count,41,n.breite)
      exrange_insert(ex_ranges,count,42,n.hoehe)
      exrange_insert(ex_ranges,count,43,n.masse)
      exrange_insert(ex_ranges,count,44,volumen)
      exrange_insert(ex_ranges,count,45,rohdichte)
      exrange_insert(ex_ranges,count,46,n.bruchlast)
      exrange_insert(ex_ranges,count,48,round)
      count += 1
    }
    @excel.visible = true
  end
  
  private
  def exrange_insert(ex_ranges,count,num,text)
    @excel.Range("#{ex_ranges[count]}#{num}")['Value'] = text
    #@excel.Range(ex_ranges[count].to_s+num.to_s)['Value'] = text
  end
  
  def toggle_excel=(visible)
    @excel.visible = visible
  end
end
