#
# EXTEND CORE CLASSES HERE
#

class Numeric
    def mround(multiple)
      (self/multiple).round() * multiple
    #rescue
    #  (self/multiple).round(1) * multiple
    end
end