unit DelphiToHero.Model.DAO.Params;

interface

uses
  DelphiToHero.Model.DAO.Interfaces,
  Vcl.Forms, System.JSON;

type
  TModelDAOParams = class(TInterfacedObject, iDAOParamInterface)
    private
      [weak]
      FParent : iDAOInterface;
      FPage : Integer;
      FLimit : Integer;
      FTotal : Integer;
      FPages : Integer;
      FForm : TForm;
      FBaseURL : String;
      FEndPoint : String;
      FPK : String;
      FOrder : String;
      FSort : String;
      FAccept : String;
      FBody : String;
      FToken : String;
      FContent : TJsonObject;
    public
      constructor Create(Parent : iDAOInterface);
      destructor Destroy; override;
      class function New(Parent : iDAOInterface) : iDAOParamInterface;
      function Page : Integer; overload;
      function Page ( aValue : Integer ) : iDAOParamInterface;  overload;
      function Limit : Integer; overload;
      function Limit ( aValue : Integer ) : iDAOParamInterface; overload;
      function Total ( aValue : Integer ) : iDAOParamInterface; overload;
      function Total : Integer; overload;
      function Pages ( aValue : Integer ) : iDAOParamInterface; overload;
      function Pages : Integer; overload;
      function Form ( aValue : TForm ) : iDAOParamInterface; overload;
      function Form : TForm; overload;
      function BaseURL ( aValue : String ) : iDAOParamInterface; overload;
      function BaseURL : String; overload;
      function EndPoint ( aValue : String ) : iDAOParamInterface; overload;
      function EndPoint : String; overload;
      function PK ( aValue : String ) : iDAOParamInterface; overload;
      function PK : String; overload;
      function Order ( aValue : String ) : iDAOParamInterface; overload;
      function Order : String; overload;
      function Sort ( aValue : String ) : iDAOParamInterface; overload;
      function Sort : String; overload;
      function Accept ( aValue : String ) : iDAOParamInterface; overload;
      function Accept : String; overload;
      function Body ( aValue : String ) : iDAOParamInterface; overload;
      function Body : String; overload;
      function Token ( aValue : String ) : iDAOParamInterface;overload;
      function Token : String; overload;
      function Content : TJsonObject; overload;
      function Content ( aValue : TJsonObject ) : iDAOParamInterface; overload;
      function Content ( aValue : String ) : iDAOParamInterface; overload;
      function &End : iDAOInterface;
  end;

implementation

uses
  Bind4D;

{ TModelDAOParams }

function TModelDAOParams.&End: iDAOInterface;
begin
  Result := FParent;
end;

function TModelDAOParams.Accept: String;
begin
  Result := FAccept;
end;

function TModelDAOParams.Accept(aValue: String): iDAOParamInterface;
begin
  Result := Self;
  FAccept := aValue;
end;

function TModelDAOParams.BaseURL: String;
begin
  Result := FBaseURL;
end;

function TModelDAOParams.BaseURL(aValue: String): iDAOParamInterface;
begin
  Result := Self;
  FBaseURL := aValue;
end;

function TModelDAOParams.Body: String;
begin
  Result := FBody;
end;

function TModelDAOParams.Body(aValue: String): iDAOParamInterface;
begin
  Result := Self;
  FBody := aValue;
end;

function TModelDAOParams.Content(aValue: TJsonObject): iDAOParamInterface;
begin
  Result := Self;
  FContent := aValue;
end;

function TModelDAOParams.Content: TJsonObject;
begin
  Result := FContent;
end;

constructor TModelDAOParams.Create(Parent : iDAOInterface);
begin
  FParent := Parent;
end;

destructor TModelDAOParams.Destroy;
begin
  if Assigned(FContent) then
    FContent.Free;

  inherited;
end;

function TModelDAOParams.EndPoint(aValue: String): iDAOParamInterface;
begin
  Result := Self;
  FEndPoint := aValue;
end;

function TModelDAOParams.EndPoint: String;
begin
  Result := FEndPoint;
end;

function TModelDAOParams.Form(aValue: TForm): iDAOParamInterface;
begin
  Result := Self;
  FForm := aValue;

  TBind4D.New
    .Form(FForm)
    .BindFormRest(
      FEndPoint,
      FPK,
      FOrder,
      FSort);
end;

function TModelDAOParams.Form: TForm;
begin
  Result := FForm;
end;

function TModelDAOParams.Limit: Integer;
begin
  Result := FLimit;
end;

function TModelDAOParams.Limit(aValue: Integer): iDAOParamInterface;
begin
  Result := Self;
  FLimit := aValue;
end;

class function TModelDAOParams.New(Parent : iDAOInterface) : iDAOParamInterface;
begin
  Result := Self.Create(Parent);
end;

function TModelDAOParams.Order: String;
begin
  Result := FOrder;
end;

function TModelDAOParams.Order(aValue: String): iDAOParamInterface;
begin
  Result := Self;
  FOrder := aValue;
end;

function TModelDAOParams.Page(aValue: Integer): iDAOParamInterface;
begin
  Result := Self;
  FPage := aValue;
end;

function TModelDAOParams.Page: Integer;
begin
  Result := FPage;
end;

function TModelDAOParams.Pages: Integer;
begin
  Result := FPages;
end;

function TModelDAOParams.Pages(aValue: Integer): iDAOParamInterface;
begin
  Result := Self;
  FPages := aValue;
end;

function TModelDAOParams.PK: String;
begin
  Result := FPK;
end;

function TModelDAOParams.PK(aValue: String): iDAOParamInterface;
begin
  Result := Self;
  FPK := aValue;
end;

function TModelDAOParams.Sort(aValue: String): iDAOParamInterface;
begin
  Result := Self;
  FSort := aValue;
end;

function TModelDAOParams.Sort: String;
begin
  Result := FSort;
end;

function TModelDAOParams.Token: String;
begin
  Result := FToken;
end;

function TModelDAOParams.Token(aValue: String): iDAOParamInterface;
begin
  Result := Self;
  FToken := aValue;
end;

function TModelDAOParams.Total: Integer;
begin
  Result := FTotal;
end;

function TModelDAOParams.Total(aValue: Integer): iDAOParamInterface;
begin
  Result := Self;
  FTotal := aValue;
end;

function TModelDAOParams.Content(aValue: String): iDAOParamInterface;
begin
  Result := Self;
  FContent := TJSONObject.ParseJSONValue(aValue) as TJsonObject;
end;

end.
