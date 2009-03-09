# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class OldCube
  
  attr_accessor :auftraggebende_NL,:beschaffenheit,:lagerung_luft,:lagerung_wasser,:buch_nummer,:prf_nummer,
                :betonwerk,:firma,:pk,:betonfestigkeitsklasse,:betonsorte,:lieferschein,:bauteil,
                :soll_alter,:lufttemperatur,:frischbetontemperatur,:ausbreit,:prf_alter,:protokoll_nummer,
                :laenge,:hoehe,:breite,:masse,:volumen,:rohdichte,:bruchlast,:kurzzeichen
              
  attr_writer :herstelldatum,:prf_datum,:einlieferungsdatum
 
  
  def self.init_fields
     %W[auftraggebende_NL beschaffenheit lagerung_luft lagerung_wasser buch_nummer prf_nummer
                betonwerk firma pk betonfestigkeitsklasse betonsortelieferschein bauteil
                soll_alter lufttemperatur frischbetontemperatur ausbreit prf_alter protokoll_nummer,
                laenge hoehe breite masse volumen rohdichte bruchlast kurzzeichen herstelldatum prf_datum einlieferungsdatum]
  end
  
  alias_method :lagerunginwasser,:lagerung_wasser
  alias_method :lagerunginluftlabor,:lagerung_luft
  alias_method :pruefbuchnummer,:buchnummer
  
  def initialize;end
  
  class << self
    alias_method :fields,:init_fields
  end
  
  def herstelldatum
    date_helper self.herstelldatum
  end
  
  def prf_datum
    date_helper self.prf_datum
  end
  
  def einlieferungsdatum
    date_helper self.einlieferungsdatum
  end
  
  
  
  
  private
  def date_helper(date)
    k = date.herstelldatum.split_t
    k.to_german_date_string
  end
end
