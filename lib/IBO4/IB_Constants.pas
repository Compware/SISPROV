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
{     João Batista Silva <saxum@ig.com.br>                                     }  
{     João Batista Silva <jbs@portovelho.br>                                   }
{     Carlos H Cantu <www.interbase-br.com>                                    }
{     Fábio R Bot Silva <fabiobot@puppi.com.br>                                }
{     José Eduardo Caldas <zeduardo2000@hotmail.com>                           }
{     Cláudio Edijanio de Araújo <claudioedjanio@aol.com>  - 19/09/2001        }
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

  IB_REG_MESSAGE = 'Obrigado por avaliar o IB Objects.'#10#13#10#13'Por favor vá ao site http://www.ibobjects.com e registre-se hoje.';

{ Error constants for IB_Connection, IB_Trannsaction, IB_Statement }

  E_CONNECTED         = 'A conexão já foi estabelecida';
  E_NOT_CONNECTED     = 'A conexão não foi estabelecida';
  E_Invalid_conn_path = 'Caminho de conexão inválido';
  E_Cant_Repl_Int_Tr  = 'Não é possível substituir a transação interna como padrão';
  E_NO_TRANS_STARTED  = 'A transação não foi iniciada';
  E_TRANS_STARTED     = 'A transação já foi iniciada';
  E_NO_CONNECTIONS    = 'A transação não possui uma conexão';
  E_NOT_ENOUGH_CONN   = 'A transação não encontra uma ou mais conexões';
  E_CONN_LOADING      = 'Aviso: A conexão ainda está sendo carregada';
  E_TRANS_CONN_SESS   = 'Todas as conexões devem pertencer a uma mesma IB_Session';
  E_TransactionPaused = 'A transação está em pausa';
  E_ALLOCATED         = 'A sentença já foi alocada';
  E_NOT_ALLOCATED     = 'A sentença não foi alocada';
  E_PREPARED          = 'A sentença já foi preparada';
  E_NOT_PREPARED      = 'A sentença não foi preparada';
  E_FAILED_TO_PREPARE = 'Falha ao preparar a sentença';
  E_OPENED           = 'A sentença já foi aberta';
  E_NOT_OPENED       = 'A sentença não foi aberta';
  E_CANT_DELETE      = 'O registro atual neste cursor não pode ser apagado';
  E_NO_CONNECTION    = 'A sentença deve ter uma IB_Connection designada';
  E_CONNECT_FAILED   = 'Incapaz de abrir a IB_Connection';
E_LoginForm_Not_Implemented = 'Login form not implemented for TIB_Connection';
  E_NO_TRANSACTION   = 'A sentença deve ter uma IB_Transaction designada';
  E_NO_ACTIVE_TRANS  = 'Não há uma transação ativa para a execução';
  E_START_FAILED     = 'Incapaz de iniciar uma transação';
  E_SVRAUTOCMT_NOEXP = 'Não é permitida uma transação explícita com ServerAutoCommit';
  E_Cannot_Activate  = 'Estado inválido da transação. Não é possível ativar';
  E_Transaction_Is_Active = 'A transação possui alterações pendentes';
  E_Failed_To_Post_Datasets = 'Falha ao salvar todos os Datasets';
  E_Failed_To_Cancel_Datasets = 'Falha ao cancelar a gravação de todos os Datasets';
  E_UpdateWrongTrn    = 'Não é possível atualizar, %s não pertence a %s';
    E_StringLenExceeded = 'Estouro em %s: %s bytes eram esperados, mas %s bytes foram encontrados';
  E_NO_BLANK_SQL      = 'Não é permitida uma sentença SQL em branco';
  E_AT_END_OF_FILE    = 'No final do arquivo';
  E_AT_END_OF_CURSOR  = 'No final do cursor';
  E_AT_END_OF_BUFFER  = 'No final do buffer';
  E_AT_END_OF_DATASET = 'No final do dataset';
  E_BAD_SQL_INF_LEN   = 'Tamanho inesperado de isc_dsql_sql_info';
  E_BAD_SQL_INF_DATA  = 'Dados inválidos foram retornados por isc_dsql_sql_info';
  E_CURSOR_NAME_LOCK  = 'Não é possível alterar o nome do cursor enquanto este estiver ativo';
  E_REQUEST_LIVE_ACTIVE = 'Não é possível alterar o RequestLive enquanto ativo';
  E_REQUEST_LIVE_READONLY = 'Não é possível ajustar o RequestLive para verdadeiro em um dataset somente para leitura';
  E_CURSOR_UNI              = 'O IB_CURSOR é unidirecional';
  E_UNSUPPORTED_COLUMN       = 'Tipo de coluna não suportado: %d';
  E_FIELDNO_NOT_FOUND         = 'Campo Nº: %d não encontrado';
  E_FIELDNAME_NOT_FOUND        = 'Campo: %s não encontrado';
  E_INVALID_FOCUS_RELATION_NO   = 'Relação No: %d inválida';
  E_INVALID_FOCUS_RELATION_NAME = 'Relação: %s inválida';
  E_INVALID_QBE_IN              = 'Erro de sintaxe em: IN( valor [ , valor ... ] )';
  E_INVALID_QBE_BETWEEN         = 'Erro de sintaxe em: BETWEEN valor AND valor';
  E_UNABLE_TO_LOCATE_DLL_IMPORT = 'Não é possível localizar a DLL de importação %s';
  E_INVALID_SQL_KEY_FIELDS  = 'Valor da propriedade SQLKeyFields inválido';
  E_GET_CURSOR_ERROR      = 'Não é possível abrir o cursor sem os dados chaves';
  E_SCROLL_ERROR          = 'Registro chave perdido'#10#13'Falha ao abrir o cursor';
  E_INVALID_BUFFER_ROW_NUM = 'Valor de BufferRowNum inválido antes de iniciar';
  E_BLANK_STATEMENT      = 'Não é possível preparar uma sentença em branco';
  E_UNKNOWN_STATEMENT  = 'Tentativa de executar uma sentença desconhecida';
  E_CIRCULAR_REFERENCE = 'Não é permitida referência circular';
  E_CANT_CHG_WITH_CONN  = 'Não é possível alterar enquanto estiver conectado';
  E_LOGIN_FAILED        = 'Falha durante o Login';
  E_CANT_GET_CONN_CHR   = 'Não foi possível obter as características da conexão';
  E_MAX_EVENTS_BLOCK   = 'Número máximo de eventos para um bloco excedido';
  E_PROCESSING_EVENTS = 'Processando eventos'#13#10'Não é possível finalizar o registro';
  E_CANT_STORE_BLOB = 'Blob já foi ou não pode ser salvo';
  E_CANT_LOAD_BLOB   = 'Blob já foi ou não pode ser carregado';
  E_CANNOT_CANCEL_ROW = 'Não é possível cancelar o registro atual';
  E_CANNOT_POST_ROW = 'Não é possivel salvar o registro atual';
  E_DatasetClosed = 'O Dataset está inativo';
  E_DatasetOpen      = 'O Dataset já está aberto';
  E_DatasetCannotScroll = 'O Dataset não pode ser movimentado';
  E_DatasetReadOnly   = 'O Dataset é somente para leitura';
  E_DatasetIsFetching = 'O Dataset está sendo carregado';
  E_Invalid_KeyRelation = 'Valor da propriedade KeyRelation inválido';
  E_RowNum_Not_Implemented = 'RowNum ainda não foi implementado';
  E_RowDeleted = 'O registro está sendo eliminado';
  E_END_OF_DATASET = 'No final do Dataset';
  E_BEGINNING_OF_DATASET = 'No início do Dataset';
  E_Cannot_Pessimistic_Lock = 'Não é possível utilizar bloqueio pessimista com LockWait';
  E_Cannot_Edit_Row = 'Não é possível alterar o registro atual';
  E_Cannot_Insert_Row = 'Não é possível inserir um novo registro';
  E_Cannot_Delete_Row = 'Não é possível apagar o registro atual';
  E_Cannot_Search = 'Pesquisa não é permitida';
  E_Cannot_Navigate = 'Não é possível navegar';
  E_Cannot_GetRecCount = 'Não foi possível obter a contagem dos registros';
  E_Record_Locked = 'O registro está bloqueado por outro usuário';
  E_Record_OutOfSynch = 'O registro foi alterado por outro usuário';
  E_FLD_READONLY = '%s é somente para leitura';
  E_Required_Field = '%s é um campo obrigatório';
  E_NO_POSTRTN_CACHED_UPDT = 'Não é possível utilizar PostRetaining com Cached Updates';
  E_Multiple_Rows_In_Singleton = 'Registros múltiplos em um carregamento de registro único';
  E_UnableToEditRow = 'Indisponível para editar a linha.';
  E_InvalidRowsAffectedBuf = 'O buffer RowsAffected é inválido';
  E_Invalid_RowNum_Past_Eof = 'RowNum além do final do arquivo inválido';
  E_Invalid_RowNum_Before_Bof = 'RowNum antes do início do arquivo inválido';
  E_Invalid_Bookmark = 'Texto de Bookmark inválido';
  E_Assign_Column   = 'Não é possível atribuir a partir de %s';
  E_AssignTo_Column = 'Não é possível atribuir para %s';
  E_Duplicate_String_Error    = 'Erro String Duplicado';
  E_Value_Out_Of_Range = 'Valor fora dos limites';
  E_SmallintOverflow = 'Tamanho de Smallint excedido';
  E_IntegerOverflow = 'Tamanho de Integer excedido';
  E_Int64Overflow = 'Tamanho de Int64 excedido';
  E_UndefinedMacro = 'Macro não definida';
  E_GeneratorFailed = 'Não é possível obter o valor do gerador';
  E_MustBe_Buffered_Dataset = 'IB_Query deve ser derivada de TIB_BDataset';
  E_NO_CHANGE_READONLY = 'Não é possível alterar ReadOnly uma vez iniciado';
  E_NO_CHANGE_ISOLATION = 'Não é possível alterar Isolation uma vez iniciado';
  E_NO_CHANGE_RECVERSION = 'Não é possível alterar RecVersion uma vez iniciado';
  E_NO_CHANGE_LOCKWAIT = 'Não é possível alterar LockWait uma vez iniciado';
  E_Invalid_Reference_To_Delete = 'Referência inválida a Delete';
  E_Invalid_Typecast = 'Conversão de tipos inválida';
  E_Invalid_DataPump_Statement = 'Tipo de sentença inválido para DataPump';
  E_FIELD_NOT_NULLABLE = 'Atribuído valor NULL para um campo NOT NULL';
  E_DATABASE_BLANK = 'A propriedade DatabaseName não pode estar vazia';
  E_Unsupp_Col_Conversion = 'Conversão de coluna não suportada';
  E_Unable_To_Locate_Record = 'Não é possível localizar o registro';
  E_Record_Not_Inserted = 'O registro não foi inserido';
  E_Invalid_KeyLinks = 'Entrada inválida na propriedade KeyLinks: %s';
  E_Unable_to_perform_search = 'Não é possível efetuar a pesquisa';
  E_Unassigned_Blob_Node = 'BlobNode não atribuído';
  E_Unassigned_Transaction = 'Transação não atribuída';
  E_Invalid_RowsAffected_Buffer = 'O Buffer para RowsAffected é inválido';
  E_Unable_Save_Graphic = 'Não é possível salvar para Graphic';
  E_Cannot_Activate_Transaction = 'Não é possível ativar a transação';
  E_IB_Client_Not_Installed = 'O cliente InterBase (GDS32.DLL) não está instalado';
  E_Could_Not_Load_Memo = 'Não foi possível carregar o memo';
  E_Invalid_DPB_Over_255 = 'DPB inválido: Contém mais que 255 caracteres';
  E_Inv_Custom_DML = 'Referência personalizada a coluna DML inválida: %s';
  E_Record_Not_Located_For_Update = 'O registro não foi localizado para atualização';
  E_Record_Not_Located_For_Delete = 'O registro não foi localizado para eliminação';
  E_Init_Default_SQL_Failed = 'Não foi possível inicializar o valor padrão em %s';
  E_Stringlist_Not_Sorted = 'A Stringlist deve estar ordenada para esta operação';
  E_Cannot_Change_Events = 'Não é possível alterar eventos enquanto é efetuado o processamento';
  E_Cannot_Unregister_Events = 'Não é possível finalizar o registro de eventos enquanto é efetuado o processamento';
  E_Invalid_Internal_Transaction = 'IB_Transaction interna inválida';
  E_InvalidStatementType = 'Tipo de sentença inválido';
  E_Multiple_Records_Updated = 'Multiplos registros atualizados';
  E_Multiple_Records_Deleted = 'Multiplos registros eliminados';
  E_Multiple_Records_Inserted = 'Multiplos registros inseridos';
  E_DUP_DB_NAME = 'Não é permitida propriedade DatabaseName duplicada';
  E_INVALID_DB_NAME = 'O valor da propriedade DatabaseName é inválido';
  E_UnableToSearch_NoOrdering = 'Impossibilitado de realizar a pesquisa, nenhuma ordem foi definida';
  E_UnableToSearch_DatasetBusy = 'Impossibilitado de realizar a pesquisa, dataset está ocupado procurando por dados';
  E_NoRecordsFound = 'Nenhum registro encontrado';
  E_Session_Undefined = 'A Session está indefinida';
  E_NoCircularRef = 'Não é permitida referência circular';
  E_InvalidClassType = 'Tipo de classe inválido';
  E_Invalid_RowNum = 'RowNum inválido';
  E_Invalid_Syntax = 'Sintaxe inválida: parêntese sobrando ou faltando';
  E_Array_Is_Null = 'O Array é nulo';
  E_No_Record_Data_To_Load = 'Nenhum registro para carregar';
E_Default_Session_Capability_Disabled = 'Default Session Capability Disabled';
  E_Cannot_add_blank_account = 'Não é possível adicionar uma conta em branco';
  E_Cannot_add_SYSDBA_account = 'Não é possível adicionar uma conta SYSDBA';
  E_Cannot_delete_blank_account = 'Não é possível apagar uma conta em branco';
  E_Cannot_delete_SYSDBA_account = 'Não é possível apagar a conta SYSDBA';
  E_Cannot_modify_blank_account = 'Não é possível alterar uma conta em branco';

  E_PLAN_ERROR = 'ERRO NO PLANO DE ACESSO!';
  E_PLAN_EXCEPTION = 'EXCEÇÃO NO PLANO DE ACESSO!';

  E_INV_CREATE_CONNECT_DROP = 'Sintaxe para CREATE, CONNECT ou DROP DATABASE inválida';
  E_Unsupported = 'Não suportado';
  E_NotImplemented = 'Não implementado neste nível';
  E_Invalid_ColData = 'ColData Inválida';

  E_Cant_Unprepare_executing_process = 'Não é possível cancelar a preparação de um processo que está em execução';
  E_FileName_Required = 'O preenchimento de FileName é obrigatório';
  E_DB_INFO_REC_TRUNCATED = 'O buffer de retorno das informações do banco de dados foi truncado';
  E_Not_implemented = 'Não implementado';
  E_Cursor_is_already_open = 'O cursor ainda está aberto';
  E_Cannot_use_LocateNearest_with_NULL = 'Não é possível usar o LocateNearest com NULOS';
  E_No_LocateLinks_entries = 'Nenhuma entrada em LocateLinks';
  E_SysExecPost_Unassigned_RowNode = 'RowNode não definido em SysExecPost';
  E_Invalid_Boolean_string_conversion = 'Conversão de booleano para string inválida:';
  E_Unsupported_array_variant_conversion = 'Conversão de array variant não suportada';
  E_Dimensions_are_different = 'As dimensões são diferentes';
  E_Dimension_has_diff_no_of_elements = 'A dimensão tem diferentes números de elementos';
  E_Variant_must_be_of_an_array_type = 'Variant deve ser de um tipo array';
  E_Invalid_dimensions = 'Dimensões inválidas';
  E_Lower_dimension_out_of_bounds = 'Dimensão inferior fora das limitações';
  E_Upper_dimension_out_of_bounds = 'Dimensão superior fora das limitações';
  E_Unable_to_assign_to_array_AsString = 'Não foi possível atribuir ao array AsString';
  E_String_truncation = 'String truncado:';
  E_Unexpected_Boolean_Value = 'Valor booleano inesperado';
  E_Params_buffer_size_mismatch = 'Tamanho do buffer Params incompatível';
  E_Invalid_INSERT_statement_No_columns = 'Declaração INSERT inválida: Nenhuma coluna';
  E_Not_ready_yet = 'Não pronto ainda';
  E_Must_create_a_TIB_Column_instance = 'É necessário criar uma instância de TIB_Column';
  E_Graphic_format_not_supported = 'Formato gráfico não suportado!';  {!!!}
  E_Only_one_file_allowed = 'Só um arquivo é permitido!';

{ Labels for various default dialogs used in IBO }
  //IBF_Base
  L_DefaultLayoutName = 'Default';

  //IBF_Users
  L_USERS_FRM = 'Gerenciamento das Contas dos Usuários';
  L_USERS_ADD = 'Adicionar';
  L_USERS_DELETE = 'Excluir';
  L_USERS_MODIFIY = 'Alterar';
  L_USERS_ACCOUNT = 'Conta';
  L_USERS_PASSWORD = 'Senha';
  L_USERS_PASSWORD_CONFIRM = 'Confirmar a senha';
  L_USERS_GROUP = 'Grupo';
  L_USERS_FIRSTNAME = 'Primeiro Nome';
  L_USERS_MIDDLENAME = 'Nome do Meio';
  L_USERS_LASTNAME = 'Último Nome';

  //IBF_Export
  L_EXPORT_FRM = 'Exportar';
  L_EXPORT_ASCII = ' Formato de arquivo ';
  L_EXPORT_FIXED = 'TXT Registro com tamanho fixo';
  L_EXPORT_DELIMITED = 'CSV Delimitado';
  L_EXPORT_DBF  = 'DBF  (Necessita de algum teste)';
  L_EXPORT_ASCIIOPT  = ' Opções do formato ASCII';
  L_EXPORT_DELIMITER  = 'Delimitador';
  L_EXPORT_SEPARATOR  = 'Separador';
  L_EXPORT_DATEFORMAT  = 'Formato de Data';
  L_EXPORT_INCLUDEHEADERS  = 'Incluir Cabeçalhos';
  L_EXPORT_INCLUDECRLF  = 'Incluir CRLF';
  L_EXPORT_SDEXPORTTITLE = 'Exportar';
  L_EXPORT_SDEXPORTFILTERCSV = 'Arquivos textos separado por vírgula( *.CSV )|*.CSV';
  L_EXPORT_SDEXPORTFILTERTXT = 'Arquivos textos ( *.TXT )|*.TXT';
  L_EXPORT_SDEXPORTFILTERDBF = 'Arquivos DBF  ( *.DBF )|*.DBF';

{ Message constants for various default dialogs used in IBO }

  M_Abort_Fetching = 'Tem certeza que deseja abortar?';
  M_Fetching_Query_Results = 'Resultado do carregamento';
  M_Row_Num = 'Linha# %d';
  M_Abort_Fetching_Btn = 'Abortar';

  M_Login_Database = 'Banco';
  M_Login_User = 'Usuário';
  M_Login_Password = 'Senha';
M_Login_OK_Btn = 'OK';
  M_Login_Cancel_Btn = 'Cancelar';
  M_Login_Help_Btn = 'Aj&uda';
  M_Login_Dialog_Caption = 'Login';

  M_Loading_Caption = 'Carregando...';

  M_SB_REC_CNT = 'Total de registros: %d';
  M_Save_Changes = 'Salva as alterações?';
  M_Abort_Changes = 'Alterações serão perdidas. Continuar?';

  M_CancelTransactionPrompt = 'Tem certeza que deseja cancelar todas as alterações?';

  M_SCRIPT_ABORT_EXECUTE = 'Aborta a execução deste script?';
  M_SCRIPT_CONTINUE_EXECUTING = 'Continua executando este script?';
  M_SCRIPT_IS_EXECUTING = 'O Script já está sendo executado';
  M_SCRIPT_FAILED = 'O Script não foi concluído';
  M_SCRIPT_WAS_ABORTED = 'A execução do Script foi abortada';
  M_SCRIPT_COMPLETED = 'O Script foi completado com sucesso';
  M_SCRIPT_CMPL_EXCEPT = 'O Script foi completado com problemas';
  M_SCRIPT_MODIFIED = 'Modificado';
  M_SCRIPT_SAVE_CHANGES = 'Salva alterações?';

{ Button captions }

  C_BTN_TODAY = 'Hoje';
  C_BTN_CLEAR = 'Limpar';
  C_BTN_FIND = 'Procurar';
  C_BTN_FINDNEXT = 'Procurar próximo';
  C_BTN_REPLACE = 'Substituir';
  C_BTN_UNDO = 'Desfazer';
  C_BTN_CUT = 'Recortar';
  C_BTN_COPY = 'Copiar';
  C_BTN_PASTE = 'Colar';
  C_BTN_DELETE = 'Apagar';
  C_BTN_SELECTALL = 'Selecionar todos';

  C_SG_Parameter = 'Parâmetro';
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
  M_SQL_SessionBusy = 'Sessão ocupada atualmente';
  M_SQL_CompleteTransaction = 'Complete sua transação';
  M_SQL_CannotDeleteDefaultGroup = 'Grupo padrão não pode ser excluido';
  M_SQL_ReservedName = 'Este nome é reservado: ';
  M_SQL_BackSlashNotAllowed = 'Slash em branco não é permitido';
  M_SQL_BlankNameNotAllowed = 'Nome em branco não é permitido';
  M_SQL_RowsFetched = 'Linhas Lidas: ';
  M_SQL_ConfirmDBCreation = 'Deseja realmente criar este banco de dados?';
  M_SQL_ConfirmNoOtherDBSameName = 'Verifique que não existe nenhum banco com o mesmo nome.';
  M_SQL_ConfirmDBDrop = 'Tem certeza que deseja apagar este banco de dados?';
  M_SQL_ReConfirmDBDrop = 'Este banco de dados será permanetemente apagado.'+#13#10+#13#10'Continua assim mesmo?';
  M_SQL_AskFormName = 'Nome da consulta:';
  M_SQL_AskGroupName = 'Nome do grupo:';
  M_SQL_AskLayoutName = 'Nome do layout:';
  M_SQL_ConfirmGroupDeletion = 'Deseja realmente apagar o grupo %s com todos seus sub-itens?';
  M_SQL_ConfirmLayoutDeletion = 'Confirma exclusão do layout %s ?';
  M_SQL_RecursiveCopyNotAllowed = 'Copia recursiva não permitida';

  // IBF_GenCustomSQL
  M_GCSQL_DoubleClickOrEnterItem = 'Dê um click duplo no item ou pressione Enter com um item selecionado.';
  M_GCSQL_ParameterValue = 'Valor do paramêtro';
  M_GCSQL_TypeAValueFor = 'Digite um valor para %s';
  M_GCSQL_ProcedureWithoutParams = 'Procedure não tem paramêtros.';

  // IBF_DataPump
  M_DP_STILL_ACTIVE = 'O processo de cópia continua ativo.';
  M_DP_ARE_YOU_SURE = 'Tem certeza?';
  M_DP_SELECT_SOURCE_DB = 'Selecione o banco de origem';
  M_DP_SELECT_DEST_DB = 'Selecione o banco de destino';

  // IBF_USERS
C_BTN_USERS_OK = 'Ok';
  C_BTN_USERS_CLEAR = 'Limpar';
  E_PASSWORD_NO_MATCH = 'As senhas estão diferentes';
  M_USERS_COMPLETED_OK = 'Operação completada com sucesso';
  M_USERS_NO_CONNECTION = 'Conexão não definida.';

  // IBF_Query
  M_QRY_ASSIGN_ORDERING_ITEMS = 'Atribui itens de ordenação?';
M_QRY_CLEAR_QUERY           = 'Clear current query?';
M_QRY_ROWS_COUNTED          = 'Rows Counted: ';
M_QRY_NEW_COL_ATTR          = 'New ColumnAttribute entry: ';
M_QRY_CancelChanges         = 'Cancel changes?';
C_QRY_BrowseEditColAttr     = 'Browse/Edit Column Attributes';
C_QRY_HINT_ACTION           = 'Hint Action';
C_QRY_HINT_TEXT             = 'Hint Text';
C_QRY_SetOrderingItems      = 'Set ordering items';

  // IBF_Export
  C_BTN_EXPORT_BEGIN = 'Iniciar exportação';
  M_EXPORT_STILL_ACTIVE = 'O processo de exportação continua ativo.';

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
  C_wbWhoBtnHint        = 'Visualizar quem está conectado ao banco';
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
  C_wbUsersBtnHint      = 'Gerenciar os usuários do banco';
  C_wbUsersBtnCaption   = 'Usuários';

  // Array grid
  C_AG_Row             = 'Linha';
  C_AG_Column          = 'Coluna';

  //IBF_Who
  C_WHO_FRM            = 'Quem está conectado';
  C_WHO_BTNAPPLY       = 'Atualizar';

  //Bars
  C_NB_FIRST = 'Primeiro';
    C_NB_JUMPBCK = 'Recuar';
  C_NB_PRIOR = 'Anterior';
  C_NB_NEXT = 'Próximo';
    C_NB_JUMPFWD = 'Avançar';
  C_NB_LAST = 'Último';

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

  C_TB_StartTransaction = 'Iniciar Transação';
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
  H_UB_POSTSEARCH = 'Salvar o critério de pesquisa';
  H_UB_CANCELSEARCH = 'Cancelar o critério de pesquisa';
  H_UB_POSTEDIT = 'Salvar as alterações';
  H_UB_CANCELEDIT = 'Cancelar as alterações';
  H_UB_POSTINSERT = 'Salvar inserção';
  H_UB_CANCELINSERT = 'Cancelar inserção';
  H_UB_POSTDELETE = 'Confirmar exclusão';
  H_UB_CANCELDELETE = 'Cancelar exclusão';
  H_UB_POST = 'Salvar as alterações';
  H_UB_CANCEL = 'Cancelar as alterações';

  H_NB_FIRST = 'Primeiro Registro';
  H_NB_PRIOR = 'Registro Anterior';
  H_NB_NEXT = 'Próximo Registro';
  H_NB_LAST = 'Último Registro';
  H_NB_JUMPBCK = 'Recuar';
  H_NB_JUMPFWD = 'Avançar';

  H_SB_ORDER = 'Ordenar Registros no Dataset';
  H_SB_LAST_CRITERIA = 'Recarrega o último critério de pesquisa';
  H_SB_SEARCH = 'Pesquisar no Dataset';
  H_SB_SAVE_CRITERIA = 'Salvar o critério';
  H_SB_CLEAR_CRITERIA = 'Limpar o critério';
  H_SB_RECALL_CRITERIA = 'Recarregar o critério';
  H_SB_SEARCHCOUNT = 'Contar os registros que estão em conformidade com o critério';
  H_SB_COUNT = 'Contar os registros no Dataset';
  H_SB_RESTRUCTURE = 'Personalizar os Campos a serem Apresentados';

  H_TB_StartTransaction = 'Iniciar Transação';
  H_TB_PostDatasets = 'Salvar os Datasets';
  H_TB_CancelDatasets = 'Cancelar os Datasets';
  H_TB_SavePoint = 'Efetua o Commit e retém a transação atual';
  H_TB_CommitRetain = 'Salva os Datasets, efetua o Commit e retém a transação atual';
  H_TB_Commit = 'Efetua o Commit e termina a transação atual';
  H_TB_Rollback = 'Efetua o Rollback e termina a transação atual';
  H_TB_RollbackRetain = 'Efetua o Rollback e retém a transação atual';
  H_TB_Close = 'Fecha a transação atual';

  H_ST_Prepare_Statement = 'Preparar Código';
  H_ST_Unprepare_Statement = 'Cancelar Preparação do Código';
  H_ST_Execute_Statement = 'Executar o Código';

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
  H_RD_actVisible = 'Tornar campos selecionados visíveis';
  H_RD_actVisibleAll = 'Tornar todos os campo visíveis';
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
  eNoAsciiFileEnty           = 'Não foi informado o arquivo ASCII de origem';
  eNoDestTableEntry          = 'Não foi informada a tabela de destino';
  eAsciiFileNotFound         = 'Arquivo ASCII %s não encontrado';
  eIniFileNotFound           = 'Arquivo Ini %s não encontrado';
  eNoAsciiFileAccess         = 'Não foi possível a abertura do arquivo ASCII  %s';
  eInvalidCharFound          = 'Caracter inválido  / erro de formato no arquivo ASCII';
  eOutOfMemory               = 'Falta de memória';
  eFieldDescriptionError     = 'Erro na descrição do campo';
  eWrongAsciiFieldCount      = 'Contagem errada dos campos no arquivo ASCII';
  eWrongDecimalCount         = 'Número de decimais errada na lista de campos (%s)';
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
  STR_DDL_coSecondaryFiles = 'Definir arquivos secundário';
  STR_DDL_coDefineShadows = 'Definir sombras';
  STR_DDL_coSetGeneratorVal = 'Setar valor do generator';
  STR_DDL_coResetExceptionNo = 'Reiniciar número de exceção';
  STR_DDL_coRawFieldDefs = 'Definição natural do campo';
  STR_DDL_coIsolateAllComputed = 'Isolar todos campos computed';
  STR_DDL_coReportMinor = 'Menor definição';
  STR_DDL_coAlwaysQuoted = 'Sempre com aspas';
  STR_DDL_coAlwaysCharSet = 'Sempre definir character set';
  STR_DDL_coIncludeDebug = 'Incluir comentários para debug';
  STR_DDL_coDescripAsComment = 'Descrições como comentários';
  STR_DDL_coIgnoreDependencies = 'Ignorar dependências';
  STR_DDL_coKeepCustomIndexNames = 'Manter nomes de índices personalizados.';
  STR_DDL_coUseBigInt = 'Usuario BIGINT';

  // CodePass Names
  STR_DDL_cpFull = 'Completo';
  STR_DDL_cpInit = 'Inicial';
STR_DDL_cpFinal = 'Final';
  STR_DDL_cpAuto = 'Automático';

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
  STR_DDL_CodeOptions = 'Opções de código';
  STR_DDL_Entities = 'Entidades';
  STR_DDL_Terminator = 'Terminador';
  STR_DDL_InsertCommits = 'Inserir Commits';
  STR_DDL_ExecuteControls = 'Executar Controles';
  STR_DDL_CodePass = 'Passagem de código';
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
  E_DDL_CURSOR_NOT_CREATED = 'Cursor não criado';
  E_DDL_BLANK_NAME         = 'Nome em branco';
  E_DDL_ENTITY_NOT_FOUND   = 'Entidade não encontrada';
  E_DDL_RESERVED_NAME      = 'Nome reservado para entidade non-system.';
  E_DDL_DB_CHARSET_NOT_FOUND = 'Character Set de banco de dados %s não foi encontrado para adquirir seu nome de canonic';
  E_DDL_MODULE_NAME_EMPTY  = 'Nome do módulo está vazio';
  E_DDL_ENTRY_POINT_EMPTY  = 'Ponto de entrada está vazio';
  E_DDL_DOMAIN_MUST_BE_EXPLICIT = 'Domínio externo só pode estar implícito';
  E_DDL_DOMAIN_TYPE_16     = 'Tipo 16 só pode ser NUMERIC ou DECIMAL';
  E_DDL_CHARSET_NULL_ASSUME_NONE = 'Charset Id era NULL, assumindo NONE';
  E_DDL_CHARSET_BLANK_ASSUME_NONE = 'Nome perdido para charset ID %s assumindo NONE';
  E_DDL_BPC_ZERO_IN_CHARSET = 'BytesPerCharacter está zero no charset %s';
  E_DDL_FIELDLEN_MISMATCH  = 'FieldLength %s deveria ser múltiplo de %s bytes por caracter no charset de nome %s';
  E_DDL_INVALID_COLLATIONID = 'Collation Id não pode ser < 0 mas é %s';
  E_DDL_COLLATION_NULL_ASSUME = 'Collation Id está NULL, assumindo %s';
  E_DDL_UNKNOWN_FIELD_TYPE = 'FieldType não conhecido %s';
  E_DDL_CSTRING_IN_DSQL = 'FieldType CSTRING não é aceito pelo DSQL';
  E_DDL_QUAD_IN_DSQL = 'FieldType QUAD não é aceito pelo DSQL';
  E_DDL_SUSPICIOUS_CHECK = 'Check suspicious: %s';
  E_DDL_VOID_CHECK_CONSTRAINT = 'Declarado, mas nulo check constraint';
  E_DDL_EXPLICIT_COMPUTED = 'Domínio explícito não pode ser COMPUTED';
  E_DDL_VOID_COMPUTED = 'Declarado, mas nulo cláusula COMPUTED BY';
  E_DDL_SUSPICIOUS_DEFAULT = 'Suspicious padrão: %s';
  E_DDL_VOID_DEFAULT = 'Declarado, mas nulo padrão';
  E_DDL_DIMENSIONS_MISMATCH = 'Declarado com dimensão %s, mas detalhes para dimensão %s foram encontrados.';
  E_DDL_IMPLICIT_DOMAIN_NO_RELATION = 'Domínio implícito não possui nenhuma relação.';
  E_DDL_IMPLICIT_DOMAIN_NO_FIELD = 'Domínio implícito tem relação perdida ou nome de campo.';
  E_DDL_NO_OUTPUT_PARAMETER = 'Não há parâmetro de saída.';
  E_DDL_NO_GRANTOR = 'Concessor não especificado';
  E_DDL_VIEW_NO_BLR = 'Não tem view_blr mas aparece em rdb$view_relations como uma VISÃO';
  E_DDL_VIEW_NO_VIEW_RELATION = 'Tem view_blr mas não aparece em rdb$view_relations como uma VISÃO';
  E_DDL_NO_OWNER = 'Proprietário não foi especificado.';
  E_DDL_FORMAT_VERSION = 'Formate a versão para %s';
  E_DDL_DBKEY_LEN = 'DbKey_Length deveria ser 8 mas é %s';
  E_DDL_NO_DOMAIN_FOR_FIELD = 'Domain/Field Definition para o campo %s não encontado';
  E_DDL_NO_SOURCE_CODE = 'Nenhum código fonte disponível';
  E_DDL_WITH_CHECK_COMPLETION = '"With check" completado para "with check option"';
  E_DDL_NO_BLR = 'Nenhum BLR disponível';
  E_DDL_CORRUPT_SOURCE = 'Prefixo de fonte não reconhecido, isto pode indicar corrupção';
  E_DDL_INDEX_ID_NULL_INACTIVE = 'Id é NULL e o índice está inativo';
  E_DDL_INDEX_ID_NULL_ACTIVE = 'Id é NULL, mas o índice está ativo';
  E_DDL_INVALID_INDEX_ID = 'Id não pode começar em 1. Deve ser %s';
  E_DDL_FK_INDEX_NO_CONSTRAINT = 'Declaração de chave estrangeira não foi encontrada em relation constraints como índice de FK';
  E_DDL_CONSTRAINT_NO_FK_INDEX = 'Não declarada chave estrangeira, mas foi encontrado em relation constraints um índice de FK';
  E_DDL_INDEX_MULTI_USE = 'Usado ao mesmo tempo %s relation constraints';
  E_DDL_INDEX_NO_FIELDS = 'Usado %s campos';
  E_DDL_INDEX_DUPLICATE = 'Parece ser um duplicação de índice na tabela: %s';
  E_DDL_INDEX_SEG_MISMATCH = 'Índices da tabela: %s declarou %s segmentos, mas detalhes para %s segmentos foram encontrados';
  E_DDL_CONSTRAINT_OUT_OF_RANGE = 'Constraint type %s está fora da faixa';
  E_DDL_CONSTRAINT_USING_INDEX = 'Constraint type %s não pode usar um índice, mas está usando o índice: %s';
  E_DDL_CONSTRAINT_NO_INDEX = 'O tipo do Constraint %s pode usar um índice, mas não está usando nenhum';
  E_DDL_UPDATE_RULE_INVALID = 'Update rule %s está fora da faixa';
  E_DDL_DELETE_RULE_INVALID = 'Delete rule %s está fora da faixa';
  E_DDL_PARENT_CONSTRAINT_EMPTY = 'Constraint name para relação-pai está vazio';
  E_DDL_FOREIGN_NOT_DEFINED = 'Tabela estrangeira ou índice não foram definidos.';
  E_DDL_PARENT_SHOULD_BE_EMPTY = 'Constraint name para relação-pai deveria ser vazio, mas é %s';
  E_DDL_UPDATE_SHOULD_BE_EMPTY = 'Update rule deveria ser vazio, mas é %s';
  E_DDL_DELETE_SHOULD_BE_EMPTY = 'Delete rule deveria ser vazio, mas é %s';
  E_DDL_NO_BLR_WITH_CHECK =  'Nenhum código fonte disponível, possivelmente usada para a visão %s com opção de check';
  E_DDL_TRIGGER_LOST_CHECK = 'Começo com a palavra "CHECK". É usado por um check constraint que esteve perdido';
  E_DDL_UNKNOWN_TRIGGER_TYPE = 'Tipo não conhecido para trigger %s';
  E_DDL_NEGATIVE_SEQUENCE = 'Existe seqüência negativa %s';
  E_DDL_NO_TARGET_RELATION = 'Tabela destino ou visão não foram especificadas';
  E_DDL_NOT_IN_DEPENDENCIES = 'Declarada, mas não encontrada nas dependências. Não é um bug em alguns casos especiais';
  E_DDL_SUSPICIOUS_TRIGGER = 'Trigger Suspicious depende de outra tabela, mas há nenhuma linkada.';
  E_DDL_INVALID_TRIGGER_SEQ = 'A sequência da trigger é %s, mas deveria ser menos que 1 para uma trigger implícita.';
  E_DDL_GRANT_OUT_OF_RANGE = 'Grant/Admin fora de 0..2 Faixa: %s';
  E_DDL_GRANT_TO_USER_TYPE = 'Grant/Admin opção dada para o usuário %s';
  E_DDL_GRANT_FIELDS = 'Tentando fixar campos específicos mas o privilégio não é U ou R';
  E_DDL_EXECUTE_TO_OBJECT = 'Nomeando EXECUTE em tipo de objeto %s que deveria ser 5 (proc)';
  E_DDL_BAD_PRIV_ON_PROC = 'Nomeando %s na procedure %s';
  E_DDL_MEMBER_TO_OBJECT = 'Membership nomeando em tipo de objeto %s que deveria ser 13 (role)';
  E_DDL_BAD_PRIV_ON_ROLE = 'Nomeando %s em role %s';
  E_DDL_BAD_ARG_POS =  'Posição do arqumento deve ser >=0, mas é %s';
  E_DDL_SYSTEM_FLAG_MISMATCH = 'SystemFlag diferente do objeto-pai';
  E_DDL_BAD_FIELD_ID = 'Campo Id deve ser >=0, mas é %s';
  E_DDL_BAD_FIELD_POS = 'Posição do campo deve ser >=0, mas é %s';
  E_DDL_BAD_TABLE_BASEFIELD = 'BaseField deveria estar vazio para as tabelas, mas está %s';
  E_DDL_BAD_TABLE_VIEWCONTEXT = 'ViewContext deveria estar vazio para as tabelas, mas está %s';
  E_DDL_MANDATORY_IN_VIEW = 'Não pode ser obrigatório em uma view';
  E_DDL_BASEFIELD_EMPTY = 'BaseField não deveria estar vazio para views se ViewContext > 0';
  E_DDL_VIEWCONTEXT_EMPTY = 'ViewContext não pode ser vazio para views';
  E_DDL_VIEWCONTEXT_NEGATIVE = 'ViewContext deveria ser >= 0 para views';
  E_DDL_BAD_PARAM_TYPE = 'Tipo de parâmetro %s está fora da faixa';
  E_DDL_BAD_PARAM_NUM = 'Número de parâmetro deve ser >=0 mas é %s';
  E_DDL_BAD_PARAM_MECHANISM = 'O mecanismo de parâmetros para a UDF %s não é válido.';

  // Comments output with DDL statements
  C_DDL_CONNECT_USERNAME   = 'Conectado usando o usuário: %s';
  C_DDL_CONNECT_SERVER_VER = 'e o servidor: %s';
C_DDL_SQL_DIALECT = 'SQL DIALECT = %s';
  C_DDL_CHARACTER_SET = 'CHARACTER SET padrão = %s';
  C_DDL_NO_SEC_FILES = 'Nenhum arquivo secundário';
  C_DDL_SEC_FILES = 'Arquivos secundários';
  C_DDL_SEC_FILE_DESC = '%s, Inicio: %s, Tamanho: %s';
  C_DDL_NO_SHADOW_FILES = 'Nenhum arquivo Shadow';
  C_DDL_SHADOW_FILES = 'Arquivos Shadow';
  C_DDL_SHADOW_FILE_DESC = '%s, %s, Inicio: %s, Tamanho: %s';
  C_DDL_EXCEPTION_DESC = 'Exceção: %s, Número original: %s';
  C_DDL_FIELD_NOT_FOUND = 'Campo não encontrado: %s';
  C_DDL_INDEX_NOT_FOUND = 'Índice não encontrado';
  C_DDL_NO_FOREIGN_RELATION = 'Nenhum relacionamento de chave-estrangeira ou índice definido para a restrição.';
  C_DDL_FOREIGN_NOT_FOUND = 'Relacionamento de chave estrangeira não encontrado: %s';
  C_DDL_FOREIGN_IDX_NOT_FOUND = 'Índice de chave estrangeira não encontrado: %s';
  C_DDL_TRIGGER_NOT_FOUND = 'Trigger não encontrada: %s';
  C_DDL_INVALID_CONSTRAINT_TYPE = 'Restrição inválida com o nome: %s';
  C_DDL_NO_TRIGGER_SOURCE = 'Nenhum código-fonte para a Trigger: %s';
  C_DDL_BAD_TRIGGER_TYPE = 'TriggerType não conhecido: %s';
  C_DDL_BAD_PRIVILEGE = 'Privilégios não conhecidos: %s';

E_FTS_InvalidStatus_Load     = 'Invalid status to load FTS index from';
E_FTS_InvalidStatus_Drop     = 'Invalid status to drop FTS index from';
E_FTS_InvalidStatus_Populate = 'Invalid status to populate FTS index from';
E_FTS_InvalidStatus_Activate = 'Invalid status to activate FTS index from';

E_Invalid_text_in_HexTextToBinary = 'Invalid text in HexTextToBinary';
E_Invalid_numeric_format = 'Invalid numeric format';
E_Trans_Not_Valid_For_Conn = 'Transaction is not valid for the current connection';

implementation

end.
