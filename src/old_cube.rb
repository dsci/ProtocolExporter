# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class OldCube
  
  attr_accessor :auftraggebendenl,:beschaffenheit,:lagerung_luft,:lagerung_wasser,:buch_nummer,:prf_nummer,
                :betonwerk,:firma,:pk,:betonfestigkeitsklasse,:betonsorte,:lieferschein,:bauteil,
                :soll_alter,:lufttemperatur,:frischbetontemperatur,:ausbreit,:prf_alter,:protokoll_nummer,
                :laenge,:hoehe,:breite,:masse,:volumen,:rohdichte,:bruchlast,:kurzzeichen,:baustellenbezeichnung,:ist_alter,
                :herstelldatum,:prf_datum,:einlieferungsdatum
 
  
  def self.init_fields
     %W[auftraggebendeNL beschaffenheit lagerung_luft lagerung_wasser buch_nummer prf_nummer
                betonwerk firma pk betonfestigkeitsklasse betonsortelieferschein bauteil
                soll_alter lufttemperatur frischbetontemperatur ausbreit prf_alter protokoll_nummer ist_alter
                laenge hoehe breite masse volumen rohdichte bruchlast kurzzeichen herstelldatum prf_datum einlieferungsdatum]
  end
  
  alias_method :lagerunginwasser,:lagerung_wasser
  alias_method :lagerunginluftlabor,:lagerung_luft
  alias_method :pruefbuchnummer,:buch_nummer
  alias_method :betonsortelieferschein=, :betonsorte=
  #alias_method "protokoll_nummer,=".to_sym,:protokoll_nummer
  
  def initialize;end
  
  class << self
    alias_method :fields,:init_fields
  end
  
  def herstell_datum
    date_helper self.herstelldatum
  end
  
  def prfdatum
    date_helper self.prf_datum
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
