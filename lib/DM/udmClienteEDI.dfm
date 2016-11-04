object dmClienteEDI: TdmClienteEDI
  OldCreateOrder = False
  Left = 411
  Top = 284
  Height = 150
  Width = 215
  object dcmEDI: TDCOMConnection
    ServerGUID = '{1A135FB6-F4CC-49DB-8D7B-03AE2E538190}'
    ServerName = 'EDI.rdmEDI'
    BeforeConnect = dcmEDIBeforeConnect
    Left = 80
    Top = 40
  end
end
