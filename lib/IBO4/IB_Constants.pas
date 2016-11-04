{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF FPC}

{                                                                              }
{ IB_Constants-br                                                              }
{                                                                              }

{***************************************************************}
{                                                               }
{          IB Objects Components and Resources Library          }
{                                                               }
{          Copyright (C) 1996-2011 Jason Wharton                }
{          and CPS - Computer Programming Solutions, Malta, ID  }
{                                                               }
{  This source code unit is released under the terms of the     }
{  CPS Trustware License.                                       }
{  It may be distributed or deployed as source code or in       }
{  compiled form only in compliance with the terms and          }
{  conditions of the CPS Trustware License which may be         }
{  examined at http://www.ibobjects.com/ibo_trustware.html      }
{                                                               }
{***************************************************************}

{******************************************************************************}
{  CONTRIBUTED MODIFICATIONS                                                   }
{  Additions or modifications listed below using format:                       }
{                                                                              }
{  Joe Citizen <joe@joecitizen.com>                                            }
{  mm/dd/yyyy                                                                  }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{            Copyright (C) 2001 Joe Citizen                                    }
{                                                                              }
{------------------------------------------------------------------------------}
{  Place your credits and information in the top of the section                }
{  below with any other descriptions or explanations desired.                  }
{------------------------------------------------------------------------------}
{                                                                              }
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  14-Apr-2005                                                                 }
{     Added some more E_DDL_* string UDF parameter checks in IB_Metadata.      }
{     Added IBO_FBCLIENT_DLL as the name for the Firebird v1.5 client, and     }
{     changed the library failure message to be more generic.                  }
{                                                                              }
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  27-Apr-2003                                                                 }
{     Added the STR_DDL_coUseBigInt string constant.                           }
{                                                                              }
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  01-Oct-2002                                                                 }
{     Lots of string constants moved from IB_Metadata.pas.                     }
{                                                                              }
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  04-May-2002                                                                 }
{     Various new string constants to match changes to IB_Metadata.pas and     }
{     IBF_Metadata.pas.                                                        }
{                                                                              }
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  09-Jan-2002                                                                 }
{     Altered E_UnableToSearch into two separate messages and expanded the     }
{     explanation to make the problems more obvious.                           }
{                                                                              }
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  07-Jan-02                                                                   }
{      Addition of constants for new IB_Metadata and related components.       }
{                                                                              }
{  Geoff Worboys <geoff@telesiscomputing.com.au>                               }
{  29-Dec-01                                                                   }
{      Addition of E_IntegerOverflow and E_Int64Overflow messages.             }
{      Removal of E_53BIT_OVERFLOW message (53bit integer no longer supported. }
{                                                                              }
{ Dirk Schiffler <ds@rcs.de>                                                   }
{ 11/11/2001                                                                   }
{    - constant G_DefaultRowHeight for property DefaultRowHeight               }
{      in the class-definitions for grids                                      }
{    - constants for date and time format strings                              }
{      using in IB_Parse and IB_Utils                                          }
{                                                                              }
{******************************************************************************}
{  TRANSLATOR MODIFICATIONS                                                    }
{  Additions or modifications listed below using format:                       }
{                                                                              }
{  Joe Citizen <joe@joecitizen.com>                                            }
{  mm/dd/yyyy                                                                  }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{            Copyright (C) 2001 Joe Citizen                                    }
{                                                                              }
{------------------------------------------------------------------------------}
{  Place your credits and information in the top of the section                }
{  below with any other descriptions or explanations desired.                  }
{------------------------------------------------------------------------------}
{                                                                              }
{   Contributing Authors:                                                      }
{                                                                              }
{     Walter Campelo <walter@weasistemas.com.br>                               }
{     Jo�o Batista Silva <saxum@ig.com.br>                                     }  
{     Jo�o Batista Silva <jbs@portovelho.br>                                   }
{     Carlos H Cantu <www.interbase-br.com>                                    }
{     F�bio R Bot Silva <fabiobot@puppi.com.br>                                }
{     Jos� Eduardo Caldas <zeduardo2000@hotmail.com>                           }
{     Cl�udio Edijanio de Ara�jo <claudioedjanio@aol.com>  - 19/09/2001        }
{                                                                              }
{******************************************************************************}


{$INCLUDE IB_Directives.inc}

unit
  IB_Constants;

interface

{$IFDEF FPC}
uses
  dynlibs;
{$ENDIF}

{$I IB_Constants.inc}

{ These may be localized. }

resourcestring

// Session
  IBO_ISC_ERR_CODE_MSG = 'ISC ERROR CODE:';
  IBO_ISC_ERR_MSG_MSG  = 'ISC ERROR MESSAGE:';
  IBO_SQL_ERR_CODE_MSG = 'SQL ERROR CODE:';
  IBO_SQL_ERR_MSG_MSG  = 'SQL ERROR MESSAGE:';

  IB_REG_MESSAGE = 'Obrigado por avaliar o IB Objects.'#10#13#10#13'Por favor v� ao site http://www.ibobjects.com e registre-se hoje.';

{ Error constants for IB_Connection, IB_Trannsaction, IB_Statement }

  E_CONNECTED         = 'A conex�o j� foi estabelecida';
  E_NOT_CONNECTED     = 'A conex�o n�o foi estabelecida';
  E_Invalid_conn_path = 'Caminho de conex�o inv�lido';
  E_Cant_Repl_Int_Tr  = 'N�o � poss�vel substituir a transa��o interna como padr�o';
  E_NO_TRANS_STARTED  = 'A transa��o n�o foi iniciada';
  E_TRANS_STARTED     = 'A transa��o j� foi iniciada';
  E_NO_CONNECTIONS    = 'A transa��o n�o possui uma conex�o';
  E_NOT_ENOUGH_CONN   = 'A transa��o n�o encontra uma ou mais conex�es';
  E_CONN_LOADING      = 'Aviso: A conex�o ainda est� sendo carregada';
  E_TRANS_CONN_SESS   = 'Todas as conex�es devem pertencer a uma mesma IB_Session';
  E_TransactionPaused = 'A transa��o est� em pausa';
  E_ALLOCATED         = 'A senten�a j� foi alocada';
  E_NOT_ALLOCATED     = 'A senten�a n�o foi alocada';
  E_PREPARED          = 'A senten�a j� foi preparada';
  E_NOT_PREPARED      = 'A senten�a n�o foi preparada';
  E_FAILED_TO_PREPARE = 'Falha ao preparar a senten�a';
  E_OPENED           = 'A senten�a j� foi aberta';
  E_NOT_OPENED       = 'A senten�a n�o foi aberta';
  E_CANT_DELETE      = 'O registro atual neste cursor n�o pode ser apagado';
  E_NO_CONNECTION    = 'A senten�a deve ter uma IB_Connection designada';
  E_CONNECT_FAILED   = 'Incapaz de abrir a IB_Connection';
E_LoginForm_Not_Implemented = 'Login form not implemented for TIB_Connection';
  E_NO_TRANSACTION   = 'A senten�a deve ter uma IB_Transaction designada';
  E_NO_ACTIVE_TRANS  = 'N�o h� uma transa��o ativa para a execu��o';
  E_START_FAILED     = 'Incapaz de iniciar uma transa��o';
  E_SVRAUTOCMT_NOEXP = 'N�o � permitida uma transa��o expl�cita com ServerAutoCommit';
  E_Cannot_Activate  = 'Estado inv�lido da transa��o. N�o � poss�vel ativar';
  E_Transaction_Is_Active = 'A transa��o possui altera��es pendentes';
  E_Failed_To_Post_Datasets = 'Falha ao salvar todos os Datasets';
  E_Failed_To_Cancel_Datasets = 'Falha ao cancelar a grava��o de todos os Datasets';
  E_UpdateWrongTrn    = 'N�o � poss�vel atualizar, %s n�o pertence a %s';
    E_StringLenExceeded = 'Estouro em %s: %s bytes eram esperados, mas %s bytes foram encontrados';
  E_NO_BLANK_SQL      = 'N�o � permitida uma senten�a SQL em branco';
  E_AT_END_OF_FILE    = 'No final do arquivo';
  E_AT_END_OF_CURSOR  = 'No final do cursor';
  E_AT_END_OF_BUFFER  = 'No final do buffer';
  E_AT_END_OF_DATASET = 'No final do dataset';
  E_BAD_SQL_INF_LEN   = 'Tamanho inesperado de isc_dsql_sql_info';
  E_BAD_SQL_INF_DATA  = 'Dados inv�lidos foram retornados por isc_dsql_sql_info';
  E_CURSOR_NAME_LOCK  = 'N�o � poss�vel alterar o nome do cursor enquanto este estiver ativo';
  E_REQUEST_LIVE_ACTIVE = 'N�o � poss�vel alterar o RequestLive enquanto ativo';
  E_REQUEST_LIVE_READONLY = 'N�o � poss�vel ajustar o RequestLive para verdadeiro em um dataset somente para leitura';
  E_CURSOR_UNI              = 'O IB_CURSOR � unidirecional';
  E_UNSUPPORTED_COLUMN       = 'Tipo de coluna n�o suportado: %d';
  E_FIELDNO_NOT_FOUND         = 'Campo N�: %d n�o encontrado';
  E_FIELDNAME_NOT_FOUND        = 'Campo: %s n�o encontrado';
  E_INVALID_FOCUS_RELATION_NO   = 'Rela��o No: %d inv�lida';
  E_INVALID_FOCUS_RELATION_NAME = 'Rela��o: %s inv�lida';
  E_INVALID_QBE_IN              = 'Erro de sintaxe em: IN( valor [ , valor ... ] )';
  E_INVALID_QBE_BETWEEN         = 'Erro de sintaxe em: BETWEEN valor AND valor';
  E_UNABLE_TO_LOCATE_DLL_IMPORT = 'N�o � poss�vel localizar a DLL de importa��o %s';
  E_INVALID_SQL_KEY_FIELDS  = 'Valor da propriedade SQLKeyFields inv�lido';
  E_GET_CURSOR_ERROR      = 'N�o � poss�vel abrir o cursor sem os dados chaves';
  E_SCROLL_ERROR          = 'Registro chave perdido'#10#13'Falha ao abrir o cursor';
  E_INVALID_BUFFER_ROW_NUM = 'Valor de BufferRowNum inv�lido antes de iniciar';
  E_BLANK_STATEMENT      = 'N�o � poss�vel preparar uma senten�a em branco';
  E_UNKNOWN_STATEMENT  = 'Tentativa de executar uma senten�a desconhecida';
  E_CIRCULAR_REFERENCE = 'N�o � permitida refer�ncia circular';
  E_CANT_CHG_WITH_CONN  = 'N�o � poss�vel alterar enquanto estiver conectado';
  E_LOGIN_FAILED        = 'Falha durante o Login';
  E_CANT_GET_CONN_CHR   = 'N�o foi poss�vel obter as caracter�sticas da conex�o';
  E_MAX_EVENTS_BLOCK   = 'N�mero m�ximo de eventos para um bloco excedido';
  E_PROCESSING_EVENTS = 'Processando eventos'#13#10'N�o � poss�vel finalizar o registro';
  E_CANT_STORE_BLOB = 'Blob j� foi ou n�o pode ser salvo';
  E_CANT_LOAD_BLOB   = 'Blob j� foi ou n�o pode ser carregado';
  E_CANNOT_CANCEL_ROW = 'N�o � poss�vel cancelar o registro atual';
  E_CANNOT_POST_ROW = 'N�o � possivel salvar o registro atual';
  E_DatasetClosed = 'O Dataset est� inativo';
  E_DatasetOpen      = 'O Dataset j� est� aberto';
  E_DatasetCannotScroll = 'O Dataset n�o pode ser movimentado';
  E_DatasetReadOnly   = 'O Dataset � somente para leitura';
  E_DatasetIsFetching = 'O Dataset est� sendo carregado';
  E_Invalid_KeyRelation = 'Valor da propriedade KeyRelation inv�lido';
  E_RowNum_Not_Implemented = 'RowNum ainda n�o foi implementado';
  E_RowDeleted = 'O registro est� sendo eliminado';
  E_END_OF_DATASET = 'No final do Dataset';
  E_BEGINNING_OF_DATASET = 'No in�cio do Dataset';
  E_Cannot_Pessimistic_Lock = 'N�o � poss�vel utilizar bloqueio pessimista com LockWait';
  E_Cannot_Edit_Row = 'N�o � poss�vel alterar o registro atual';
  E_Cannot_Insert_Row = 'N�o � poss�vel inserir um novo registro';
  E_Cannot_Delete_Row = 'N�o � poss�vel apagar o registro atual';
  E_Cannot_Search = 'Pesquisa n�o � permitida';
  E_Cannot_Navigate = 'N�o � poss�vel navegar';
  E_Cannot_GetRecCount = 'N�o foi poss�vel obter a contagem dos registros';
  E_Record_Locked = 'O registro est� bloqueado por outro usu�rio';
  E_Record_OutOfSynch = 'O registro foi alterado por outro usu�rio';
  E_FLD_READONLY = '%s � somente para leitura';
  E_Required_Field = '%s � um campo obrigat�rio';
  E_NO_POSTRTN_CACHED_UPDT = 'N�o � poss�vel utilizar PostRetaining com Cached Updates';
  E_Multiple_Rows_In_Singleton = 'Registros m�ltiplos em um carregamento de registro �nico';
  E_UnableToEditRow = 'Indispon�vel para editar a linha.';
  E_InvalidRowsAffectedBuf = 'O buffer RowsAffected � inv�lido';
  E_Invalid_RowNum_Past_Eof = 'RowNum al�m do final do arquivo inv�lido';
  E_Invalid_RowNum_Before_Bof = 'RowNum antes do in�cio do arquivo inv�lido';
  E_Invalid_Bookmark = 'Texto de Bookmark inv�lido';
  E_Assign_Column   = 'N�o � poss�vel atribuir a partir de %s';
  E_AssignTo_Column = 'N�o � poss�vel atribuir para %s';
  E_Duplicate_String_Error    = 'Erro String Duplicado';
  E_Value_Out_Of_Range = 'Valor fora dos limites';
  E_SmallintOverflow = 'Tamanho de Smallint excedido';
  E_IntegerOverflow = 'Tamanho de Integer excedido';
  E_Int64Overflow = 'Tamanho de Int64 excedido';
  E_UndefinedMacro = 'Macro n�o definida';
  E_GeneratorFailed = 'N�o � poss�vel obter o valor do gerador';
  E_MustBe_Buffered_Dataset = 'IB_Query deve ser derivada de TIB_BDataset';
  E_NO_CHANGE_READONLY = 'N�o � poss�vel alterar ReadOnly uma vez iniciado';
  E_NO_CHANGE_ISOLATION = 'N�o � poss�vel alterar Isolation uma vez iniciado';
  E_NO_CHANGE_RECVERSION = 'N�o � poss�vel alterar RecVersion uma vez iniciado';
  E_NO_CHANGE_LOCKWAIT = 'N�o � poss�vel alterar LockWait uma vez iniciado';
  E_Invalid_Reference_To_Delete = 'Refer�ncia inv�lida a Delete';
  E_Invalid_Typecast = 'Convers�o de tipos inv�lida';
  E_Invalid_DataPump_Statement = 'Tipo de senten�a inv�lido para DataPump';
  E_FIELD_NOT_NULLABLE = 'Atribu�do valor NULL para um campo NOT NULL';
  E_DATABASE_BLANK = 'A propriedade DatabaseName n�o pode estar vazia';
  E_Unsupp_Col_Conversion = 'Convers�o de coluna n�o suportada';
  E_Unable_To_Locate_Record = 'N�o � poss�vel localizar o registro';
  E_Record_Not_Inserted = 'O registro n�o foi inserido';
  E_Invalid_KeyLinks = 'Entrada inv�lida na propriedade KeyLinks: %s';
  E_Unable_to_perform_search = 'N�o � poss�vel efetuar a pesquisa';
  E_Unassigned_Blob_Node = 'BlobNode n�o atribu�do';
  E_Unassigned_Transaction = 'Transa��o n�o atribu�da';
  E_Invalid_RowsAffected_Buffer = 'O Buffer para RowsAffected � inv�lido';
  E_Unable_Save_Graphic = 'N�o � poss�vel salvar para Graphic';
  E_Cannot_Activate_Transaction = 'N�o � poss�vel ativar a transa��o';
  E_IB_Client_Not_Installed = 'O cliente InterBase (GDS32.DLL) n�o est� instalado';
  E_Could_Not_Load_Memo = 'N�o foi poss�vel carregar o memo';
  E_Invalid_DPB_Over_255 = 'DPB inv�lido: Cont�m mais que 255 caracteres';
  E_Inv_Custom_DML = 'Refer�ncia personalizada a coluna DML inv�lida: %s';
  E_Record_Not_Located_For_Update = 'O registro n�o foi localizado para atualiza��o';
  E_Record_Not_Located_For_Delete = 'O registro n�o foi localizado para elimina��o';
  E_Init_Default_SQL_Failed = 'N�o foi poss�vel inicializar o valor padr�o em %s';
  E_Stringlist_Not_Sorted = 'A Stringlist deve estar ordenada para esta opera��o';
  E_Cannot_Change_Events = 'N�o � poss�vel alterar eventos enquanto � efetuado o processamento';
  E_Cannot_Unregister_Events = 'N�o � poss�vel finalizar o registro de eventos enquanto � efetuado o processamento';
  E_Invalid_Internal_Transaction = 'IB_Transaction interna inv�lida';
  E_InvalidStatementType = 'Tipo de senten�a inv�lido';
  E_Multiple_Records_Updated = 'Multiplos registros atualizados';
  E_Multiple_Records_Deleted = 'Multiplos registros eliminados';
  E_Multiple_Records_Inserted = 'Multiplos registros inseridos';
  E_DUP_DB_NAME = 'N�o � permitida propriedade DatabaseName duplicada';
  E_INVALID_DB_NAME = 'O valor da propriedade DatabaseName � inv�lido';
  E_UnableToSearch_NoOrdering = 'Impossibilitado de realizar a pesquisa, nenhuma ordem foi definida';
  E_UnableToSearch_DatasetBusy = 'Impossibilitado de realizar a pesquisa, dataset est� ocupado procurando por dados';
  E_NoRecordsFound = 'Nenhum registro encontrado';
  E_Session_Undefined = 'A Session est� indefinida';
  E_NoCircularRef = 'N�o � permitida refer�ncia circular';
  E_InvalidClassType = 'Tipo de classe inv�lido';
  E_Invalid_RowNum = 'RowNum inv�lido';
  E_Invalid_Syntax = 'Sintaxe inv�lida: par�ntese sobrando ou faltando';
  E_Array_Is_Null = 'O Array � nulo';
  E_No_Record_Data_To_Load = 'Nenhum registro para carregar';
E_Default_Session_Capability_Disabled = 'Default Session Capability Disabled';
  E_Cannot_add_blank_account = 'N�o � poss�vel adicionar uma conta em branco';
  E_Cannot_add_SYSDBA_account = 'N�o � poss�vel adicionar uma conta SYSDBA';
  E_Cannot_delete_blank_account = 'N�o � poss�vel apagar uma conta em branco';
  E_Cannot_delete_SYSDBA_account = 'N�o � poss�vel apagar a conta SYSDBA';
  E_Cannot_modify_blank_account = 'N�o � poss�vel alterar uma conta em branco';

  E_PLAN_ERROR = 'ERRO NO PLANO DE ACESSO!';
  E_PLAN_EXCEPTION = 'EXCE��O NO PLANO DE ACESSO!';

  E_INV_CREATE_CONNECT_DROP = 'Sintaxe para CREATE, CONNECT ou DROP DATABASE inv�lida';
  E_Unsupported = 'N�o suportado';
  E_NotImplemented = 'N�o implementado neste n�vel';
  E_Invalid_ColData = 'ColData Inv�lida';

  E_Cant_Unprepare_executing_process = 'N�o � poss�vel cancelar a prepara��o de um processo que est� em execu��o';
  E_FileName_Required = 'O preenchimento de FileName � obrigat�rio';
  E_DB_INFO_REC_TRUNCATED = 'O buffer de retorno das informa��es do banco de dados foi truncado';
  E_Not_implemented = 'N�o implementado';
  E_Cursor_is_already_open = 'O cursor ainda est� aberto';
  E_Cannot_use_LocateNearest_with_NULL = 'N�o � poss�vel usar o LocateNearest com NULOS';
  E_No_LocateLinks_entries = 'Nenhuma entrada em LocateLinks';
  E_SysExecPost_Unassigned_RowNode = 'RowNode n�o definido em SysExecPost';
  E_Invalid_Boolean_string_conversion = 'Convers�o de booleano para string inv�lida:';
  E_Unsupported_array_variant_conversion = 'Convers�o de array variant n�o suportada';
  E_Dimensions_are_different = 'As dimens�es s�o diferentes';
  E_Dimension_has_diff_no_of_elements = 'A dimens�o tem diferentes n�meros de elementos';
  E_Variant_must_be_of_an_array_type = 'Variant deve ser de um tipo array';
  E_Invalid_dimensions = 'Dimens�es inv�lidas';
  E_Lower_dimension_out_of_bounds = 'Dimens�o inferior fora das limita��es';
  E_Upper_dimension_out_of_bounds = 'Dimens�o superior fora das limita��es';
  E_Unable_to_assign_to_array_AsString = 'N�o foi poss�vel atribuir ao array AsString';
  E_String_truncation = 'String truncado:';
  E_Unexpected_Boolean_Value = 'Valor booleano inesperado';
  E_Params_buffer_size_mismatch = 'Tamanho do buffer Params incompat�vel';
  E_Invalid_INSERT_statement_No_columns = 'Declara��o INSERT inv�lida: Nenhuma coluna';
  E_Not_ready_yet = 'N�o pronto ainda';
  E_Must_create_a_TIB_Column_instance = '� necess�rio criar uma inst�ncia de TIB_Column';
  E_Graphic_format_not_supported = 'Formato gr�fico n�o suportado!';  {!!!}
  E_Only_one_file_allowed = 'S� um arquivo � permitido!';

{ Labels for various default dialogs used in IBO }
  //IBF_Base
  L_DefaultLayoutName = 'Default';

  //IBF_Users
  L_USERS_FRM = 'Gerenciamento das Contas dos Usu�rios';
  L_USERS_ADD = 'Adicionar';
  L_USERS_DELETE = 'Excluir';
  L_USERS_MODIFIY = 'Alterar';
  L_USERS_ACCOUNT = 'Conta';
  L_USERS_PASSWORD = 'Senha';
  L_USERS_PASSWORD_CONFIRM = 'Confirmar a senha';
  L_USERS_GROUP = 'Grupo';
  L_USERS_FIRSTNAME = 'Primeiro Nome';
  L_USERS_MIDDLENAME = 'Nome do Meio';
  L_USERS_LASTNAME = '�ltimo Nome';

  //IBF_Export
  L_EXPORT_FRM = 'Exportar';
  L_EXPORT_ASCII = ' Formato de arquivo ';
  L_EXPORT_FIXED = 'TXT Registro com tamanho fixo';
  L_EXPORT_DELIMITED = 'CSV Delimitado';
  L_EXPORT_DBF  = 'DBF  (Necessita de algum teste)';
  L_EXPORT_ASCIIOPT  = ' Op��es do formato ASCII';
  L_EXPORT_DELIMITER  = 'Delimitador';
  L_EXPORT_SEPARATOR  = 'Separador';
  L_EXPORT_DATEFORMAT  = 'Formato de Data';
  L_EXPORT_INCLUDEHEADERS  = 'Incluir Cabe�alhos';
  L_EXPORT_INCLUDECRLF  = 'Incluir CRLF';
  L_EXPORT_SDEXPORTTITLE = 'Exportar';
  L_EXPORT_SDEXPORTFILTERCSV = 'Arquivos textos separado por v�rgula( *.CSV )|*.CSV';
  L_EXPORT_SDEXPORTFILTERTXT = 'Arquivos textos ( *.TXT )|*.TXT';
  L_EXPORT_SDEXPORTFILTERDBF = 'Arquivos DBF  ( *.DBF )|*.DBF';

{ Message constants for various default dialogs used in IBO }

  M_Abort_Fetching = 'Tem certeza que deseja abortar?';
  M_Fetching_Query_Results = 'Resultado do carregamento';
  M_Row_Num = 'Linha# %d';
  M_Abort_Fetching_Btn = 'Abortar';

  M_Login_Database = 'Banco';
  M_Login_User = 'Usu�rio';
  M_Login_Password = 'Senha';
M_Login_OK_Btn = 'OK';
  M_Login_Cancel_Btn = 'Cancelar';
  M_Login_Help_Btn = 'Aj&uda';
  M_Login_Dialog_Caption = 'Login';

  M_Loading_Caption = 'Carregando...';

  M_SB_REC_CNT = 'Total de registros: %d';
  M_Save_Changes = 'Salva as altera��es?';
  M_Abort_Changes = 'Altera��es ser�o perdidas. Continuar?';

  M_CancelTransactionPrompt = 'Tem certeza que deseja cancelar todas as altera��es?';

  M_SCRIPT_ABORT_EXECUTE = 'Aborta a execu��o deste script?';
  M_SCRIPT_CONTINUE_EXECUTING = 'Continua executando este script?';
  M_SCRIPT_IS_EXECUTING = 'O Script j� est� sendo executado';
  M_SCRIPT_FAILED = 'O Script n�o foi conclu�do';
  M_SCRIPT_WAS_ABORTED = 'A execu��o do Script foi abortada';
  M_SCRIPT_COMPLETED = 'O Script foi completado com sucesso';
  M_SCRIPT_CMPL_EXCEPT = 'O Script foi completado com problemas';
  M_SCRIPT_MODIFIED = 'Modificado';
  M_SCRIPT_SAVE_CHANGES = 'Salva altera��es?';

{ Button captions }

  C_BTN_TODAY = 'Hoje';
  C_BTN_CLEAR = 'Limpar';
  C_BTN_FIND = 'Procurar';
  C_BTN_FINDNEXT = 'Procurar pr�ximo';
  C_BTN_REPLACE = 'Substituir';
  C_BTN_UNDO = 'Desfazer';
  C_BTN_CUT = 'Recortar';
  C_BTN_COPY = 'Copiar';
  C_BTN_PASTE = 'Colar';
  C_BTN_DELETE = 'Apagar';
  C_BTN_SELECTALL = 'Selecionar todos';

  C_SG_Parameter = 'Par�metro';
  C_SG_Field = 'Campo';
  C_SG_Name = 'Nome';
  C_SG_Type = 'Tipo';
C_SG_Info = 'Info';
  C_SG_Value = 'Valor';

C_BF_OK = 'OK';
  C_BF_CANCEL = 'Cancelar';
  C_BF_CANCEL_ACCEL = '&Cancelar';
  C_BF_APPLY = 'Aplicar';
  C_BF_HELP = 'Ajuda';
  C_BF_EXECUTE = 'Executar';
  C_BF_CLOSE = 'Fechar';
  C_BF_CLOSE_ACCEL = '&Fechar';
  C_BF_FINISH = 'Terminar';
  C_BF_FINISH_ACCEL = '&Terminar';

  C_FRM_Ordering = 'Ordem';
  C_FRM_RESTRUCTURE = 'Personalizar Campos';

  C_CB_WordWrap = 'Quebra de Palavras';

  // IBF_SQL
  M_SQL_RowsAffected = 'Linhas Afetadas: ';
  M_SQL_RowsCounted = 'Linhas Contadas: ';
  M_SQL_SessionBusy = 'Sess�o ocupada atualmente';
  M_SQL_CompleteTransaction = 'Complete sua transa��o';
  M_SQL_CannotDeleteDefaultGroup = 'Grupo padr�o n�o pode ser excluido';
  M_SQL_ReservedName = 'Este nome � reservado: ';
  M_SQL_BackSlashNotAllowed = 'Slash em branco n�o � permitido';
  M_SQL_BlankNameNotAllowed = 'Nome em branco n�o � permitido';
  M_SQL_RowsFetched = 'Linhas Lidas: ';
  M_SQL_ConfirmDBCreation = 'Deseja realmente criar este banco de dados?';
  M_SQL_ConfirmNoOtherDBSameName = 'Verifique que n�o existe nenhum banco com o mesmo nome.';
  M_SQL_ConfirmDBDrop = 'Tem certeza que deseja apagar este banco de dados?';
  M_SQL_ReConfirmDBDrop = 'Este banco de dados ser� permanetemente apagado.'+#13#10+#13#10'Continua assim mesmo?';
  M_SQL_AskFormName = 'Nome da consulta:';
  M_SQL_AskGroupName = 'Nome do grupo:';
  M_SQL_AskLayoutName = 'Nome do layout:';
  M_SQL_ConfirmGroupDeletion = 'Deseja realmente apagar o grupo %s com todos seus sub-itens?';
  M_SQL_ConfirmLayoutDeletion = 'Confirma exclus�o do layout %s ?';
  M_SQL_RecursiveCopyNotAllowed = 'Copia recursiva n�o permitida';

  // IBF_GenCustomSQL
  M_GCSQL_DoubleClickOrEnterItem = 'D� um click duplo no item ou pressione Enter com um item selecionado.';
  M_GCSQL_ParameterValue = 'Valor do param�tro';
  M_GCSQL_TypeAValueFor = 'Digite um valor para %s';
  M_GCSQL_ProcedureWithoutParams = 'Procedure n�o tem param�tros.';

  // IBF_DataPump
  M_DP_STILL_ACTIVE = 'O processo de c�pia continua ativo.';
  M_DP_ARE_YOU_SURE = 'Tem certeza?';
  M_DP_SELECT_SOURCE_DB = 'Selecione o banco de origem';
  M_DP_SELECT_DEST_DB = 'Selecione o banco de destino';

  // IBF_USERS
C_BTN_USERS_OK = 'Ok';
  C_BTN_USERS_CLEAR = 'Limpar';
  E_PASSWORD_NO_MATCH = 'As senhas est�o diferentes';
  M_USERS_COMPLETED_OK = 'Opera��o completada com sucesso';
  M_USERS_NO_CONNECTION = 'Conex�o n�o definida.';

  // IBF_Query
  M_QRY_ASSIGN_ORDERING_ITEMS = 'Atribui itens de ordena��o?';
M_QRY_CLEAR_QUERY           = 'Clear current query?';
M_QRY_ROWS_COUNTED          = 'Rows Counted: ';
M_QRY_NEW_COL_ATTR          = 'New ColumnAttribute entry: ';
M_QRY_CancelChanges         = 'Cancel changes?';
C_QRY_BrowseEditColAttr     = 'Browse/Edit Column Attributes';
C_QRY_HINT_ACTION           = 'Hint Action';
C_QRY_HINT_TEXT             = 'Hint Text';
C_QRY_SetOrderingItems      = 'Set ordering items';

  // IBF_Export
  C_BTN_EXPORT_BEGIN = 'Iniciar exporta��o';
  M_EXPORT_STILL_ACTIVE = 'O processo de exporta��o continua ativo.';

  // IB_UtilityBar
  C_wbBrowseBtnHint     = 'Consultar banco';
  C_wbBrowseBtnCaption  = 'Consultar';
  C_wbDSQLBtnHint       = 'Executar comando no banco';
C_wbDSQLBtnCaption    = 'DSQL';
  C_wbEventsBtnHint     = 'Monitorar eventos do banco';
  C_wbEventsBtnCaption  = 'Eventos';
  C_wbExportBtnHint     = 'Exportar Dataset do banco';
  C_wbExportBtnCaption  = 'Exportar';
  C_wbDumpBtnHint       = 'Descarregar (dump) banco de dados';
  C_wbDumpBtnCaption    = 'Descarregar';
  C_wbPumpBtnHint       = 'Carregar (pump) dados de outro banco';
  C_wbPumpBtnCaption    = 'Carregar';
  C_wbWhoBtnHint        = 'Visualizar quem est� conectado ao banco';
  C_wbWhoBtnCaption     = 'Quem';
  C_wbScriptBtnHint     = 'Executar Script';
C_wbScriptBtnCaption  = 'Script';
  C_wbExtractBtnHint    = 'Extrair DDL';
  C_wbExtractBtnCaption = 'Extrair';
  C_wbMonitorBtnHint    = 'Monitorar SQL e chamadas da API';
  C_wbMonitorBtnCaption = 'Monitorar';
  C_wbProfilerBtnHint   = 'Registrar Atividade do banco de dados';
  C_wbProfilerBtnCaption= 'Registrar';
  C_wbStatusBtnHint     = 'Ver status dos componentes IBO';
C_wbStatusBtnCaption  = 'Status';
  C_wbUsersBtnHint      = 'Gerenciar os usu�rios do banco';
  C_wbUsersBtnCaption   = 'Usu�rios';

  // Array grid
  C_AG_Row             = 'Linha';
  C_AG_Column          = 'Coluna';

  //IBF_Who
  C_WHO_FRM            = 'Quem est� conectado';
  C_WHO_BTNAPPLY       = 'Atualizar';

  //Bars
  C_NB_FIRST = 'Primeiro';
    C_NB_JUMPBCK = 'Recuar';
  C_NB_PRIOR = 'Anterior';
  C_NB_NEXT = 'Pr�ximo';
    C_NB_JUMPFWD = 'Avan�ar';
  C_NB_LAST = '�ltimo';

  C_SB_ORDER = 'Ordenar';
  C_SB_SEARCH = 'Pesquisar';
  C_SB_SAVE = 'Salvar';
  C_SB_CLEAR = 'Limpar';
C_SB_RECALL = 'Recall';
  C_SB_COUNT = 'Contar';
  C_SB_RESTRUCTURE = 'Reestruturar';

  C_ST_Open = 'Abrir';
  C_ST_Close = 'Fechar';
  C_ST_Prepare = 'Preparar';
  C_ST_Unprepare = 'Despreparar';
  C_ST_ReadOnly = 'Somente Leitura';
  C_ST_New = 'Novo';
  C_ST_Post = 'Confirmar';
  C_ST_Cancel = 'Cancelar';
  C_ST_Delete = 'Apagar';
  C_ST_Edit = 'Editar';
  C_ST_RefreshKeys = 'Atualizar Chaves';
  C_ST_RefreshRows = 'Atualizar Linhas';
  C_ST_Refresh = 'Atualizar';

  C_CB_CREATE = 'Criar';
  C_CB_DROP = 'Suprimir';
  C_CB_CONNECT = 'Conectar';
  C_CB_DISCONNECT = 'Desconectar';

  C_TB_StartTransaction = 'Iniciar Transa��o';
  C_TB_PostDatasets = 'Postar';
  C_TB_CancelDatasets = 'Cancelar';
C_TB_SavePoint = 'Save Point';
  C_TB_CommitRetain = 'Commit Retendo';
C_TB_Commit = 'Commit';
C_TB_Rollback = 'Rollback';
  C_TB_RollbackRetain = 'Rollback e Reter';
  C_TB_Close = 'Fechar';

  // IBF_Events
C_EV_Register = 'Register';
C_EV_Unregister = 'Unregister';
C_EV_ClearResults = 'Clear';

  // Hints
  H_UB_EDIT = 'Alterar Registro';
  H_UB_INSERT = 'Inserir Registro';
  H_UB_DELETE = 'Apagar Registro';
  H_UB_REFRESH = 'Atualizar todos os registros';
  H_UB_REFRESHKEYS = 'Atualizar as chaves dos registros';
  H_UB_REFRESHROWS = 'Atualizar as linhas do registro';
  H_UB_REFRESHFILTROWS = 'Atualizar as linhas filtradas';
  H_UB_POSTSEARCH = 'Salvar o crit�rio de pesquisa';
  H_UB_CANCELSEARCH = 'Cancelar o crit�rio de pesquisa';
  H_UB_POSTEDIT = 'Salvar as altera��es';
  H_UB_CANCELEDIT = 'Cancelar as altera��es';
  H_UB_POSTINSERT = 'Salvar inser��o';
  H_UB_CANCELINSERT = 'Cancelar inser��o';
  H_UB_POSTDELETE = 'Confirmar exclus�o';
  H_UB_CANCELDELETE = 'Cancelar exclus�o';
  H_UB_POST = 'Salvar as altera��es';
  H_UB_CANCEL = 'Cancelar as altera��es';

  H_NB_FIRST = 'Primeiro Registro';
  H_NB_PRIOR = 'Registro Anterior';
  H_NB_NEXT = 'Pr�ximo Registro';
  H_NB_LAST = '�ltimo Registro';
  H_NB_JUMPBCK = 'Recuar';
  H_NB_JUMPFWD = 'Avan�ar';

  H_SB_ORDER = 'Ordenar Registros no Dataset';
  H_SB_LAST_CRITERIA = 'Recarrega o �ltimo crit�rio de pesquisa';
  H_SB_SEARCH = 'Pesquisar no Dataset';
  H_SB_SAVE_CRITERIA = 'Salvar o crit�rio';
  H_SB_CLEAR_CRITERIA = 'Limpar o crit�rio';
  H_SB_RECALL_CRITERIA = 'Recarregar o crit�rio';
  H_SB_SEARCHCOUNT = 'Contar os registros que est�o em conformidade com o crit�rio';
  H_SB_COUNT = 'Contar os registros no Dataset';
  H_SB_RESTRUCTURE = 'Personalizar os Campos a serem Apresentados';

  H_TB_StartTransaction = 'Iniciar Transa��o';
  H_TB_PostDatasets = 'Salvar os Datasets';
  H_TB_CancelDatasets = 'Cancelar os Datasets';
  H_TB_SavePoint = 'Efetua o Commit e ret�m a transa��o atual';
  H_TB_CommitRetain = 'Salva os Datasets, efetua o Commit e ret�m a transa��o atual';
  H_TB_Commit = 'Efetua o Commit e termina a transa��o atual';
  H_TB_Rollback = 'Efetua o Rollback e termina a transa��o atual';
  H_TB_RollbackRetain = 'Efetua o Rollback e ret�m a transa��o atual';
  H_TB_Close = 'Fecha a transa��o atual';

  H_ST_Prepare_Statement = 'Preparar C�digo';
  H_ST_Unprepare_Statement = 'Cancelar Prepara��o do C�digo';
  H_ST_Execute_Statement = 'Executar o C�digo';

  H_DS_Open_Dataset = 'Abrir Dataset';
  H_DS_Close_Dataset = 'Fechar Dataset';
  H_DS_Prepare_Dataset = 'Preparar Dataset';
  H_DS_Unprepare_Dataset = 'Despreparar Dataset';
  H_DS_ReadOnly_Dataset = 'Dataset Somente de Leitura';
H_DS_Execute_Statement = 'Execute Statement';

  H_CB_Create_Database = 'Criar Banco';
  H_CB_Connect_Database = 'Conectar ao Banco';
  H_CB_Disconnect_Database = 'Desconectar Banco';
  H_CB_Drop_Database = 'Apagar Banco';

  H_RD_actHide = 'Ocultar campos selecionados';
  H_RD_actHideAll = 'Ocultar todos os campos';
  H_RD_actVisible = 'Tornar campos selecionados vis�veis';
  H_RD_actVisibleAll = 'Tornar todos os campo vis�veis';
  H_RD_actUp = 'Mover campos selecionados para cima';
  H_RD_actTop = 'Mover campos selecionados ao topo';
  H_RD_actDown = 'Mover campos selecionados para baixo';
  H_RD_actBottom = 'Mover campos selecionados ao final';

H_Click_display_index   = 'Click to display index information';
H_Click_jump_relation   = 'Click to jump to the displayed relation';
H_Click_jump_constraint = 'Click to jump to the displayed constraint';

  // IBF_Export
  H_BTN_EXPORT_BEGIN = 'Exportar a partir de um comando SELECT';

  // Error Messages - IB_Import
  eNoAsciiFileEnty           = 'N�o foi informado o arquivo ASCII de origem';
  eNoDestTableEntry          = 'N�o foi informada a tabela de destino';
  eAsciiFileNotFound         = 'Arquivo ASCII %s n�o encontrado';
  eIniFileNotFound           = 'Arquivo Ini %s n�o encontrado';
  eNoAsciiFileAccess         = 'N�o foi poss�vel a abertura do arquivo ASCII  %s';
  eInvalidCharFound          = 'Caracter inv�lido  / erro de formato no arquivo ASCII';
  eOutOfMemory               = 'Falta de mem�ria';
  eFieldDescriptionError     = 'Erro na descri��o do campo';
  eWrongAsciiFieldCount      = 'Contagem errada dos campos no arquivo ASCII';
  eWrongDecimalCount         = 'N�mero de decimais errada na lista de campos (%s)';
  eWrongFieldWidth           = 'Largura do campo errada no arquivo ASCII';

  // Metadata Extract Stuff
  // ------------------------

  // Entity Type Names
STR_DDL_UnnamedItem = '<NO NAME>';
STR_DDL_etDatabase = 'Database';
STR_DDL_etException = 'Exception';
STR_DDL_etBlobFilter = 'Blob Filter';
STR_DDL_etUDF = 'UDF';
STR_DDL_etGenerator = 'Generator';
STR_DDL_etDomain = 'Domain';
STR_DDL_etTable = 'Table';
STR_DDL_etView = 'View';
STR_DDL_etProcedure = 'Procedure';
STR_DDL_etRole = 'Role';
STR_DDL_etPrimaryKey = 'Primary Key';
STR_DDL_etUniqueKey = 'Unique Key';
STR_DDL_etForeignKey = 'Foreign Key';
STR_DDL_etConstraint = 'Constraint';
STR_DDL_etIndex = 'Index';
STR_DDL_etTrigger = 'Trigger';
STR_DDL_etPermission = 'Permission';
STR_DDL_etUDFParam = 'UDF Parameter';
STR_DDL_etTableField = 'Table Field';
STR_DDL_etViewField = 'View Field';
STR_DDL_etProcParam = 'Procedure Parameter';

  // CodeOption Names
  STR_DDL_coCreateDatabase = 'Criar banco de dados';
  STR_DDL_coSecondaryFiles = 'Definir arquivos secund�rio';
  STR_DDL_coDefineShadows = 'Definir sombras';
  STR_DDL_coSetGeneratorVal = 'Setar valor do generator';
  STR_DDL_coResetExceptionNo = 'Reiniciar n�mero de exce��o';
  STR_DDL_coRawFieldDefs = 'Defini��o natural do campo';
  STR_DDL_coIsolateAllComputed = 'Isolar todos campos computed';
  STR_DDL_coReportMinor = 'Menor defini��o';
  STR_DDL_coAlwaysQuoted = 'Sempre com aspas';
  STR_DDL_coAlwaysCharSet = 'Sempre definir character set';
  STR_DDL_coIncludeDebug = 'Incluir coment�rios para debug';
  STR_DDL_coDescripAsComment = 'Descri��es como coment�rios';
  STR_DDL_coIgnoreDependencies = 'Ignorar depend�ncias';
  STR_DDL_coKeepCustomIndexNames = 'Manter nomes de �ndices personalizados.';
  STR_DDL_coUseBigInt = 'Usuario BIGINT';

  // CodePass Names
  STR_DDL_cpFull = 'Completo';
  STR_DDL_cpInit = 'Inicial';
STR_DDL_cpFinal = 'Final';
  STR_DDL_cpAuto = 'Autom�tico';

  // Problem level names
  STD_DDL_plNone       = 'Nenhum';
  STD_DDL_plMinor      = 'Menor';
  STD_DDL_plSuspicious = 'Suspeito';
  STD_DDL_plWarning    = 'Aviso';
  STD_DDL_plError      = 'Erro';
  // abbreviated Problem level names (to 5 characters)
  STD_DDL_plNone_s       = 'NADA ';
  STD_DDL_plMinor_s      = 'MENOR';
STD_DDL_plSuspicious_s = 'SUSP ';
  STD_DDL_plWarning_s    = 'AVISO';
  STD_DDL_plError_s      = 'ERRO ';

  // Dialog strings
  STR_DDL_DialogCaption = 'Extrair Metadata';
  STR_DDL_Configure = 'Configurar';
  STR_DDL_Filters = 'Filtros';
STR_DDL_Script = 'Script';
STR_DDL_MetadataControls = 'Metadata Controls';
  STR_DDL_CodeOptions = 'Op��es de c�digo';
  STR_DDL_Entities = 'Entidades';
  STR_DDL_Terminator = 'Terminador';
  STR_DDL_InsertCommits = 'Inserir Commits';
  STR_DDL_ExecuteControls = 'Executar Controles';
  STR_DDL_CodePass = 'Passagem de c�digo';
  STR_DDL_ExtractToStrings = 'Extrair para strings';
  STR_DDL_Reset = 'Ressetar';
  STR_DDL_ResetAll = 'Ressetar todos';
  STR_DDL_ProgressControls = 'Controles de progresso';
  STR_DDL_Stop = 'Pare';
  STR_DDL_IncludeSystem = 'Incluir System Objects';
STR_DDL_NameMasks = 'Name Masks';
  STR_DDL_SaveToFile = 'Salvar para arquivo';
  STR_DDL_RunScript = 'Rodar Script';
  STR_DDL_ScriptCommands = 'Comandos de &Script';

  // Errors/Problems reported during extract processing
  // Note that all replaceable parameters use %s (string), any necessary
  // conversions will be performed in the code.
  E_DDL_CURSOR_NOT_CREATED = 'Cursor n�o criado';
  E_DDL_BLANK_NAME         = 'Nome em branco';
  E_DDL_ENTITY_NOT_FOUND   = 'Entidade n�o encontrada';
  E_DDL_RESERVED_NAME      = 'Nome reservado para entidade non-system.';
  E_DDL_DB_CHARSET_NOT_FOUND = 'Character Set de banco de dados %s n�o foi encontrado para adquirir seu nome de canonic';
  E_DDL_MODULE_NAME_EMPTY  = 'Nome do m�dulo est� vazio';
  E_DDL_ENTRY_POINT_EMPTY  = 'Ponto de entrada est� vazio';
  E_DDL_DOMAIN_MUST_BE_EXPLICIT = 'Dom�nio externo s� pode estar impl�cito';
  E_DDL_DOMAIN_TYPE_16     = 'Tipo 16 s� pode ser NUMERIC ou DECIMAL';
  E_DDL_CHARSET_NULL_ASSUME_NONE = 'Charset Id era NULL, assumindo NONE';
  E_DDL_CHARSET_BLANK_ASSUME_NONE = 'Nome perdido para charset ID %s assumindo NONE';
  E_DDL_BPC_ZERO_IN_CHARSET = 'BytesPerCharacter est� zero no charset %s';
  E_DDL_FIELDLEN_MISMATCH  = 'FieldLength %s deveria ser m�ltiplo de %s bytes por caracter no charset de nome %s';
  E_DDL_INVALID_COLLATIONID = 'Collation Id n�o pode ser < 0 mas � %s';
  E_DDL_COLLATION_NULL_ASSUME = 'Collation Id est� NULL, assumindo %s';
  E_DDL_UNKNOWN_FIELD_TYPE = 'FieldType n�o conhecido %s';
  E_DDL_CSTRING_IN_DSQL = 'FieldType CSTRING n�o � aceito pelo DSQL';
  E_DDL_QUAD_IN_DSQL = 'FieldType QUAD n�o � aceito pelo DSQL';
  E_DDL_SUSPICIOUS_CHECK = 'Check suspicious: %s';
  E_DDL_VOID_CHECK_CONSTRAINT = 'Declarado, mas nulo check constraint';
  E_DDL_EXPLICIT_COMPUTED = 'Dom�nio expl�cito n�o pode ser COMPUTED';
  E_DDL_VOID_COMPUTED = 'Declarado, mas nulo cl�usula COMPUTED BY';
  E_DDL_SUSPICIOUS_DEFAULT = 'Suspicious padr�o: %s';
  E_DDL_VOID_DEFAULT = 'Declarado, mas nulo padr�o';
  E_DDL_DIMENSIONS_MISMATCH = 'Declarado com dimens�o %s, mas detalhes para dimens�o %s foram encontrados.';
  E_DDL_IMPLICIT_DOMAIN_NO_RELATION = 'Dom�nio impl�cito n�o possui nenhuma rela��o.';
  E_DDL_IMPLICIT_DOMAIN_NO_FIELD = 'Dom�nio impl�cito tem rela��o perdida ou nome de campo.';
  E_DDL_NO_OUTPUT_PARAMETER = 'N�o h� par�metro de sa�da.';
  E_DDL_NO_GRANTOR = 'Concessor n�o especificado';
  E_DDL_VIEW_NO_BLR = 'N�o tem view_blr mas aparece em rdb$view_relations como uma VIS�O';
  E_DDL_VIEW_NO_VIEW_RELATION = 'Tem view_blr mas n�o aparece em rdb$view_relations como uma VIS�O';
  E_DDL_NO_OWNER = 'Propriet�rio n�o foi especificado.';
  E_DDL_FORMAT_VERSION = 'Formate a vers�o para %s';
  E_DDL_DBKEY_LEN = 'DbKey_Length deveria ser 8 mas � %s';
  E_DDL_NO_DOMAIN_FOR_FIELD = 'Domain/Field Definition para o campo %s n�o encontado';
  E_DDL_NO_SOURCE_CODE = 'Nenhum c�digo fonte dispon�vel';
  E_DDL_WITH_CHECK_COMPLETION = '"With check" completado para "with check option"';
  E_DDL_NO_BLR = 'Nenhum BLR dispon�vel';
  E_DDL_CORRUPT_SOURCE = 'Prefixo de fonte n�o reconhecido, isto pode indicar corrup��o';
  E_DDL_INDEX_ID_NULL_INACTIVE = 'Id � NULL e o �ndice est� inativo';
  E_DDL_INDEX_ID_NULL_ACTIVE = 'Id � NULL, mas o �ndice est� ativo';
  E_DDL_INVALID_INDEX_ID = 'Id n�o pode come�ar em 1. Deve ser %s';
  E_DDL_FK_INDEX_NO_CONSTRAINT = 'Declara��o de chave estrangeira n�o foi encontrada em relation constraints como �ndice de FK';
  E_DDL_CONSTRAINT_NO_FK_INDEX = 'N�o declarada chave estrangeira, mas foi encontrado em relation constraints um �ndice de FK';
  E_DDL_INDEX_MULTI_USE = 'Usado ao mesmo tempo %s relation constraints';
  E_DDL_INDEX_NO_FIELDS = 'Usado %s campos';
  E_DDL_INDEX_DUPLICATE = 'Parece ser um duplica��o de �ndice na tabela: %s';
  E_DDL_INDEX_SEG_MISMATCH = '�ndices da tabela: %s declarou %s segmentos, mas detalhes para %s segmentos foram encontrados';
  E_DDL_CONSTRAINT_OUT_OF_RANGE = 'Constraint type %s est� fora da faixa';
  E_DDL_CONSTRAINT_USING_INDEX = 'Constraint type %s n�o pode usar um �ndice, mas est� usando o �ndice: %s';
  E_DDL_CONSTRAINT_NO_INDEX = 'O tipo do Constraint %s pode usar um �ndice, mas n�o est� usando nenhum';
  E_DDL_UPDATE_RULE_INVALID = 'Update rule %s est� fora da faixa';
  E_DDL_DELETE_RULE_INVALID = 'Delete rule %s est� fora da faixa';
  E_DDL_PARENT_CONSTRAINT_EMPTY = 'Constraint name para rela��o-pai est� vazio';
  E_DDL_FOREIGN_NOT_DEFINED = 'Tabela estrangeira ou �ndice n�o foram definidos.';
  E_DDL_PARENT_SHOULD_BE_EMPTY = 'Constraint name para rela��o-pai deveria ser vazio, mas � %s';
  E_DDL_UPDATE_SHOULD_BE_EMPTY = 'Update rule deveria ser vazio, mas � %s';
  E_DDL_DELETE_SHOULD_BE_EMPTY = 'Delete rule deveria ser vazio, mas � %s';
  E_DDL_NO_BLR_WITH_CHECK =  'Nenhum c�digo fonte dispon�vel, possivelmente usada para a vis�o %s com op��o de check';
  E_DDL_TRIGGER_LOST_CHECK = 'Come�o com a palavra "CHECK". � usado por um check constraint que esteve perdido';
  E_DDL_UNKNOWN_TRIGGER_TYPE = 'Tipo n�o conhecido para trigger %s';
  E_DDL_NEGATIVE_SEQUENCE = 'Existe seq��ncia negativa %s';
  E_DDL_NO_TARGET_RELATION = 'Tabela destino ou vis�o n�o foram especificadas';
  E_DDL_NOT_IN_DEPENDENCIES = 'Declarada, mas n�o encontrada nas depend�ncias. N�o � um bug em alguns casos especiais';
  E_DDL_SUSPICIOUS_TRIGGER = 'Trigger Suspicious depende de outra tabela, mas h� nenhuma linkada.';
  E_DDL_INVALID_TRIGGER_SEQ = 'A sequ�ncia da trigger � %s, mas deveria ser menos que 1 para uma trigger impl�cita.';
  E_DDL_GRANT_OUT_OF_RANGE = 'Grant/Admin fora de 0..2 Faixa: %s';
  E_DDL_GRANT_TO_USER_TYPE = 'Grant/Admin op��o dada para o usu�rio %s';
  E_DDL_GRANT_FIELDS = 'Tentando fixar campos espec�ficos mas o privil�gio n�o � U ou R';
  E_DDL_EXECUTE_TO_OBJECT = 'Nomeando EXECUTE em tipo de objeto %s que deveria ser 5 (proc)';
  E_DDL_BAD_PRIV_ON_PROC = 'Nomeando %s na procedure %s';
  E_DDL_MEMBER_TO_OBJECT = 'Membership nomeando em tipo de objeto %s que deveria ser 13 (role)';
  E_DDL_BAD_PRIV_ON_ROLE = 'Nomeando %s em role %s';
  E_DDL_BAD_ARG_POS =  'Posi��o do arqumento deve ser >=0, mas � %s';
  E_DDL_SYSTEM_FLAG_MISMATCH = 'SystemFlag diferente do objeto-pai';
  E_DDL_BAD_FIELD_ID = 'Campo Id deve ser >=0, mas � %s';
  E_DDL_BAD_FIELD_POS = 'Posi��o do campo deve ser >=0, mas � %s';
  E_DDL_BAD_TABLE_BASEFIELD = 'BaseField deveria estar vazio para as tabelas, mas est� %s';
  E_DDL_BAD_TABLE_VIEWCONTEXT = 'ViewContext deveria estar vazio para as tabelas, mas est� %s';
  E_DDL_MANDATORY_IN_VIEW = 'N�o pode ser obrigat�rio em uma view';
  E_DDL_BASEFIELD_EMPTY = 'BaseField n�o deveria estar vazio para views se ViewContext > 0';
  E_DDL_VIEWCONTEXT_EMPTY = 'ViewContext n�o pode ser vazio para views';
  E_DDL_VIEWCONTEXT_NEGATIVE = 'ViewContext deveria ser >= 0 para views';
  E_DDL_BAD_PARAM_TYPE = 'Tipo de par�metro %s est� fora da faixa';
  E_DDL_BAD_PARAM_NUM = 'N�mero de par�metro deve ser >=0 mas � %s';
  E_DDL_BAD_PARAM_MECHANISM = 'O mecanismo de par�metros para a UDF %s n�o � v�lido.';

  // Comments output with DDL statements
  C_DDL_CONNECT_USERNAME   = 'Conectado usando o usu�rio: %s';
  C_DDL_CONNECT_SERVER_VER = 'e o servidor: %s';
C_DDL_SQL_DIALECT = 'SQL DIALECT = %s';
  C_DDL_CHARACTER_SET = 'CHARACTER SET padr�o = %s';
  C_DDL_NO_SEC_FILES = 'Nenhum arquivo secund�rio';
  C_DDL_SEC_FILES = 'Arquivos secund�rios';
  C_DDL_SEC_FILE_DESC = '%s, Inicio: %s, Tamanho: %s';
  C_DDL_NO_SHADOW_FILES = 'Nenhum arquivo Shadow';
  C_DDL_SHADOW_FILES = 'Arquivos Shadow';
  C_DDL_SHADOW_FILE_DESC = '%s, %s, Inicio: %s, Tamanho: %s';
  C_DDL_EXCEPTION_DESC = 'Exce��o: %s, N�mero original: %s';
  C_DDL_FIELD_NOT_FOUND = 'Campo n�o encontrado: %s';
  C_DDL_INDEX_NOT_FOUND = '�ndice n�o encontrado';
  C_DDL_NO_FOREIGN_RELATION = 'Nenhum relacionamento de chave-estrangeira ou �ndice definido para a restri��o.';
  C_DDL_FOREIGN_NOT_FOUND = 'Relacionamento de chave estrangeira n�o encontrado: %s';
  C_DDL_FOREIGN_IDX_NOT_FOUND = '�ndice de chave estrangeira n�o encontrado: %s';
  C_DDL_TRIGGER_NOT_FOUND = 'Trigger n�o encontrada: %s';
  C_DDL_INVALID_CONSTRAINT_TYPE = 'Restri��o inv�lida com o nome: %s';
  C_DDL_NO_TRIGGER_SOURCE = 'Nenhum c�digo-fonte para a Trigger: %s';
  C_DDL_BAD_TRIGGER_TYPE = 'TriggerType n�o conhecido: %s';
  C_DDL_BAD_PRIVILEGE = 'Privil�gios n�o conhecidos: %s';

E_FTS_InvalidStatus_Load     = 'Invalid status to load FTS index from';
E_FTS_InvalidStatus_Drop     = 'Invalid status to drop FTS index from';
E_FTS_InvalidStatus_Populate = 'Invalid status to populate FTS index from';
E_FTS_InvalidStatus_Activate = 'Invalid status to activate FTS index from';

E_Invalid_text_in_HexTextToBinary = 'Invalid text in HexTextToBinary';
E_Invalid_numeric_format = 'Invalid numeric format';
E_Trans_Not_Valid_For_Conn = 'Transaction is not valid for the current connection';

implementation

end.
