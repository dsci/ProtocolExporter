def read_file(xml)
  lines = ""
  file = File.open(xml)
  file.each{|l|
    lines << l
  }
  file.close unless file.closed?
  return lines  
end