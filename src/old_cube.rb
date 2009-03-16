# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class OldCube
  
  attr_accessor :auftraggebende_nl,:aeussere_beschaffenheit,:lagerung_in_luft_labor,:lagerung_in_wasser,:pruefnummer,
                :betonwerk,:firma,:pk,:betonfestigkeitsklasse,:betonsorte,:lieferschein_nr,:bauteil,
                :soll_pruefalter,:lufttemperatur,:frischbetontemperatur,:ausbreitmass,:pruefalter,:protokollnummer,
                :laenge,:hoehe,:breite,:masse,:volumen,:rohdichte,:bruchlast,:kurzzeichen,:baustellenbezeichnung,:ist_alter,
                :herstelldatum,:pruefdatum,:einlieferungsdatum,:baustellenbezeichnung,:pruefbuch_nummer
 
  
  def self.init_fields
     %W[auftraggebende_NL aeussere_beschaffenheit lagerung_in_luft_labor lagerung_in_wasser pruefbuch_nummer pruefnummer
                betonwerk firma pk betonfestigkeitsklasse bauteil betonsorte
                soll_pruefalter lufttemperatur frischbetontemperatur ausbreitmass pruefalter protokollnummer ist_alter
                laenge hoehe breite masse volumen rohdichte bruchlast kurzzeichen herstelldatum pruefdatum einlieferungsdatum 
                baustellenbezeichnung lieferschein_nr]
  end
  
  alias_method :lagerunginwasser,:lagerung_in_wasser
  alias_method :lagerunginluftlabor,:lagerung_in_luft_labor
  #alias_method :betonsortelieferschein=, :betonsorte=
  alias_method :ist_alter,:pruefalter
  alias_method :ausbreit,:ausbreitmass
  #alias_method "protokoll_nummer,=".to_sym,:protokoll_nummer
  
  def initialize;end
  
  class << self
    alias_method :fields,:init_fields
  end
  
  def herstell_datum
    date_helper self.herstelldatum
  end
  
  def prfdatum
    date_helper self.pruefdatum
  end
  
  def einlieferungs_datum
    date_helper self.einlieferungsdatum
  end
  
  def korr_fakt; return 0.92; end
  
  
  private
  def date_helper(date)
    k = date.split_t
    k.to_german_date_string
  end
end
