#
# EXTEND CORE CLASSES HERE
#

class Numeric
    def mround(multiple)
      (self/multiple).round * multiple
    end
end