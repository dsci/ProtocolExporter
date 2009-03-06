class WuCube < Cube
  attr_accessor :prb_nr, :max_wadriti
  
  def self.fields
    fields = %w[MAX_WADRITI]
    self.init_fields + fields
  end
end