object dmLAB: TdmLAB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 473
  Top = 309
  Height = 185
  Width = 209
  object ADOCON: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=compware;Persist Security Info=True' +
      ';User ID=compware;Initial Catalog=Labor;Data Source=SOFTPLAN\SQL' +
      'EXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    BeforeConnect = ADOCONBeforeConnect
    Left = 40
    Top = 16
  end
  object ADOComand: TADOCommand
    Connection = ADOCON
    Parameters = <>
    Left = 40
    Top = 64
  end
  object ADODS: TADODataSet
    Connection = ADOCON
    Parameters = <>
    Left = 128
    Top = 40
  end
end
