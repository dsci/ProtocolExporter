#
# EXTEND CORE CLASSES HERE
#

class Numeric
    def mround(multiple)
      (self/multiple).round(2) * multiple
    #rescue
    #  (self/multiple).round(1) * multiple
    end
end