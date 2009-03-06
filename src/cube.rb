class Cube
  attr_accessor :prod_bez,:fest_kl,:konsist_ber,:prb_nummer,:prb_index,:entna_horiz,:hst_dat,:ausbr_mass,:einlief_dat,
                :prf_dat,:hoehe_i,:breite_i,:laenge_i,:lief_nr,:prf_alt_i,:eb_flaech,:luf_tp_i,:for_tp_i
  
  # to avoid strange refactoring adding some aliases
  alias_method :laenge, :laenge_i
  alias_method :breite, :breite_i
  alias_method :hoehe, :hoehe_i
  
  def self.init_fields
    %w[PROD_BEZ FEST_KL KONSIST_BER PRB_NUMMER PRB_INDEX PRB_NR ENTNA_HORIZ HST_DAT AUSBR_MASS EINLIEF_DAT PRF_DAT HOEHE_I BREITE_I LAENGE_I LIEF_NR PRF_ALT_I EB_FLAECH LUF_TP_I FOR_TP_I]
  end
  
  class << self
     alias_method :fields, :init_fields
   end
  #alias_method :fields, :init_fields
end