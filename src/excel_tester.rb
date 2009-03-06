# Author: Daniel Schmidt <demo.code@gmail.com>
# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'win32ole'

class ExcelTester
  def initialize
    test
  end
  
  def test
    excel = WIN32OLE::new('excel.Application')
    file = "C:\\Documents and Settings\\daniel_schmidt\\Work\\Bilfinger\\excel\\Protokoll_Druckfestigkeitwin2k.xls"
    workbook = excel.Workbooks.Open(file)
    worksheet = workbook.Worksheets(1) #get hold of the first worksheet
    worksheet.Select  #bring it to the front -need sometimes to run macros, 
    #    not for working with a worksheet from ruby
    excel['Visible'] = true #make visible, set to false to make invisible 
    #   again. Don't need it to be visible for script to work
    puts worksheet.Range('a7')['Value']  #get value of single cell
    #worksheet.Range('e2')['Value'] = Time.now.strftime '%d/%m/%Y' #single value
    #worksheet.Range('a1')['Value'] ="Bilfinger Berger AG"
    worksheet.range('G2')['Value'] = " Dyckerhoff Transportbeton"
  end
end

ExcelTester.new
