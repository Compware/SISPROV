unit uFuncaoContraSenha;

interface

uses
  Registry, windows, printers, messages, dialogs;

  function ValidaContraSenha(sOperacao:string):boolean;
  function GeraSenha(Str: string): string;
  function SerialNum(FDrive:String) :String;

implementation

uses SysUtils, Graphics, Controls, Forms, StdCtrls, Buttons;

Function Rsn(Cad: string): string;
const
  Chave:string = 'h1U3V4AÇ97j06Kl8m2'; {aleatórios}
var
  Cod:string;
  Pdt,Sm,x,y,w:integer;
  Psc: array[1..100] of integer;
begin
  for x:=1 to 26 do Cod:=Cod+Chr(64+x)+Chr(123-x);
  Cod:=Chave+Cod+Cad;
  for y:=1 to Length(Cad) do Psc[y]:= Pos(Cad[y],Cod);
  Sm:=0;
  Result:='';
  y:=Length(Cad);
  Cod:='47BEHKNQOTWZ258CF0ILRU369ADGJMPSVYX1';
  {Todas as letras e números sem repetição em ordem aleatória}
  for x:=1 to 4 do {quatro dígitos}
  begin
    for w:=1 to y do
    begin
      Pdt:=Psc[w]*(y-w+2);
      Sm:=Sm+Pdt;
    end;
    Sm:=(Sm mod 36)+1;
    Result:=Result+Cod[Sm];
    y:=y+1;
    Psc[y]:=Sm;
    Sm:=0;
  end;
end;

function GeraSenha(Str: string): string;
begin
  Result:= Rsn(Str);
  Result:= Result+'-'+ Rsn(Result);
  Result:= Result+'-'+ Rsn(Result);
  Result:= Result+'-'+ Rsn(Result);
end;

{Esta função pega o serial do HD}
function SerialNum(FDrive:String) :String;
var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
  try
    GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
    Result := IntToHex(Serial, 8 );
  except
    Result :='';
  end;
end;

function ValidaContraSenha(sOperacao:string):boolean;
var
  Str,Senha,Contra:String;
begin
  //Str := SerialNum('C');    //Usando Serial, sempre cria a mesma senha
  Str := FormatDateTime('hhnnss',now);
  Senha := GeraSenha(Str);               {Senha do Cliente}
  Senha := Copy(Senha,1,4);  //Estou trabalhando apenas com 1.grupo de 4 digitos
  Contra := GeraSenha(Senha);     {ContraSenha retornada}
  Contra := Copy(Contra,1,4);
  if InputBox('Liberacao de Senha', 'Para permitir ' + sOperacao + chr(13) +
    'Entre em contato com a CENTRAL(INLS)' + chr(13) +
    'Informe a Senha: ' + Senha,'') = Contra then
    result := true
  else
    result := false;
end;

end.
