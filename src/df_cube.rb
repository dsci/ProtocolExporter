class DfCube < Cube
  attr_accessor :prb_nr, :masse,:bruchlast
  
  def self.fields
    fields = %w[MASSE BRUCHLAST]
    self.init_fields + fields
  end
end