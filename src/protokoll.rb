# Author: Daniel Schmidt <demo.code@gmail.com>
# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 
=begin
Oberklasse fuer die Protokolle
Es gibt Druckpruefkoerper und WU Pruefkoerper
=end
class Protocol
  attr_accessor :aug_name1,:cubes, :korr_fakt,:prf_zg_nr,:baust,:hersteller,:prod_bez,:fest_kl
  
  
  def self.init_fields
    %w[AUG_NAME1 KORR_FAKT PRF_ZG_NR BAUST HERSTELLER PROD_BEZ FEST_KL]
  end
end