unit DelphiToHero.Model.DAO.REST;

interface

uses
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  DelphiToHero.Model.DAO.Interfaces,
  RESTRequest4D,
  Vcl.Forms,
  Bind4D,
  System.Generics.Collections;


type
  TDAOREST = class(TInterfacedObject, iDAOInterface)
    private
      FDMemTable : TFDMemTable;
      FBaseURL : String;
      FEndPoint, FPK, FOrder, FSort : String;
      FForm : TForm;
      FParamList : TDictionary<String, String>;
      function PrepareGuuid ( aValue : String ) : String;
    public
      constructor Create(aForm : TForm);
      destructor Destroy; override;
      class function New(aForm : TForm) : iDAOInterface;
      function Get : iDAOInterface;
      function Post : iDAOInterface;
      function Put : iDAOInterface;
      function Delete : iDAOInterface;
      function DataSource ( aValue : TDataSource ) : iDAOInterface;
      function DataSet : TDataset;
      function AddParam ( aKey : String; aValue : String ) : iDAOInterface;
  end;

implementation

uses
  System.SysUtils, System.JSON,  Bind4D.Types;

{ TDAOREST }

function TDAOREST.AddParam(aKey, aValue: String): iDAOInterface;
begin
  Result := Self;
  FParamList.Add(aKey, aValue);
end;

constructor TDAOREST.Create(aForm : TForm);
begin
  FDMemTable := TFDMemTable.Create(nil);
  FParamList := TDictionary<String, String>.Create;
  FBaseURL := 'http://localhost:9000';
  FForm := aForm;

  TBind4D
    .New
      .Form(FForm)
      .BindFormRest(
        FEndPoint,
        FPK,
        FOrder,
        FSort
      );
end;

function TDAOREST.DataSet: TDataset;
begin
  Result := FDMemTable;
end;

function TDAOREST.DataSource(aValue: TDataSource): iDAOInterface;
begin
  Result := Self;
  aValue.DataSet := FDMemTable;
end;

function TDAOREST.Delete: iDAOInterface;
begin
  Result := Self;
  TRequest
    .New
      .BaseURL(FBaseURL + FEndPoint + '/' + PrepareGuuid(FDMemTable.FieldByName(FPK).AsString))
      .Accept('application/json')
    .Delete;
end;

destructor TDAOREST.Destroy;
begin
  FDMemTable.Free;
  FParamList.Free;
  inherited;
end;

function TDAOREST.Get: iDAOInterface;
var
  aURL : String;
begin
  aURL := FBaseURL + FEndPoint + '?';

  if FParamList.Count > 0 then
  begin
    for var Param in FParamList do
      aURL := aURL + Param.Key + '=' + Param.Value + '&';
  end;
  aURL := Copy(aURL, 0, Length(aURL) -1);

  TRequest
    .New
      .BaseURL(aURL)
      .Accept('application/json')
      .DataSetAdapter(FDMemTable)
    .Get;

  FParamList.Clear;
end;

class function TDAOREST.New(aForm : TForm) : iDAOInterface;
begin
  Result := Self.Create(aForm);
end;

function TDAOREST.Post: iDAOInterface;
var
  aJson : TJsonObject;
begin
  Result := Self;
  aJson := TBind4D.New.Form(FForm).FormToJson(fbPost);
  try
    TRequest
      .New
        .BaseURL(FBaseURL + FEndPoint)
        .Accept('application/json')
        .AddBody(aJson.ToString)
      .Post;
  finally
    aJson.Free;
  end;
end;

function TDAOREST.PrepareGuuid(aValue: String): String;
begin
  Result := StringReplace(aValue, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;

function TDAOREST.Put: iDAOInterface;
var
  aJson : TJsonObject;
begin
  Result := Self;
  aJson := TBind4D.New.Form(FForm).FormToJson(fbPost);
  try
    TRequest
      .New
        .BaseURL(FBaseURL + FEndPoint + '/' + PrepareGuuid(FDMemTable.FieldByName(FPK).AsString))
        .Accept('application/json')
        .AddBody(aJson.ToString)
      .Put;
  finally
    aJson.Free;
  end;
end;

end.
