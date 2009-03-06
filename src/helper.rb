# Author: Daniel Schmidt <demo.code@gmail.com>
# 
# Copyright (c) 2008, Daniel Schmidt, demo.code@gmail.com
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
# 
#     * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
#     * Neither the name of the author Daniel Schmidt nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
# IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
 
#Describe your class here.


class Helper
  def self.volume(l,b,h)
    return (l.to_f * b.to_f * h.to_f)/1000000
  end
  
  def self.rohdichte(masse,volumen)
    return self.toDouble(masse)/volumen
  end
  
  def self.druckfestigkeit(l,b,bruchlast)
    return ((bruchlast.to_f/(l.to_f*b.to_f))*1000).to_f
  end
  
  def self.korr_druckfestigkeit
    
  end
  
  def self.spaltzug_fest(bruchlast,breite,hoehe)
    #(0.64*D46)/(D41*D42)*1000
    return (0.64*bruchlast.to_f)/(breite.to_f*hoehe.to_f)*1000
  end
  
  def self.round(wert,multiple)
    #wert.mround(multiple)
    #class << wert
    #  def mround(multiple)
    #  (self/multiple).round * multiple
    #  end
    #end
    
    wert.mround(multiple)
  end
  
  def self.toDouble(s)
    k = s.split(",")
    k = "#{k[0]}.#{k[1]}"
    return k.to_f
  rescue
    return s.to_f
  end
  
  
  #
  # untersucht gegebenen Text nach Buchstaben/Zahlen Kombination
  # wenn Buchstabe vorhanden, nach Zahl matchen => Zahl erhoehen
  # wenn kein Buchstabe, nur Zahl erhoehen
  def self.increaseNumber(text)
    letter_match = text.match("\\w+\\D+")
    whitespace_match = text.match("\\s")
    num = 0
    unless letter_match.nil?
      #buchstaben holen
      letter = Helper.fromArray(letter_match.to_a).to_s
      #letter = Helper.fromArray(letter_match.to_a)
      # zahl parsen
      number_match = text.match("\\d+")
      number = Helper.fromArray(number_match.to_a).to_i
      
      number = number + 1
      unless whitespace_match.nil?
        num = "#{letter}#{number}"
      else
        num = "#{letter} #{number}"
      end
     else
      #kein buchstabe kommt vor
      num = text.to_i+1
    end
    return num
  end
  
  def self.fromArray(arr)
    k = ""
    arr.each{|n| k << n}
    return k
  end
  
  def self.pruefalter(herstelldatum,pr_datum)
    pr_datum = Time.parse(pr_datum)
    herstelldatum = Time.parse(herstelldatum)
    (pr_datum.to_date - herstelldatum.to_date).to_i
  end
  
  def self.format_date(datum)
    d = datum.split('.')
    return "#{d[2]}-#{d[1]}-#{d[0]}"
  end
  
  #
  def self.vrunden(zahl,vielfaches)
    rest = zahl.divmod(vielfaches)[1]
    halb = vielfaches/2
    if rest >= halb
      #aufrunden
      zahl = zahl + rest
    else
      zahl = zahl - rest
    end 
    return zahl
  end
  
  def self.ebenflaechigkeit(text)
    if text.class.eql?(String)
      k = text.split(" ")
      unless k.empty?
        return "#{k[0][0,1].downcase}.#{k[1][0,1].capitalize}."
      else
        return ""
      end
    end
  end
end


