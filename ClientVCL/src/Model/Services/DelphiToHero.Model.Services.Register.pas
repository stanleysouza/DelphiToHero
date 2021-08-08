unit DelphiToHero.Model.Services.Register;

interface

type
  TModelServicesRegister = class
    private
      procedure RegisterAWS;
      procedure RegisterGoogleAPI;
    public
      constructor Create;
      destructor Destroy; override;
  end;

var
  aServicesRegister : TModelServicesRegister;


implementation

uses
  Bind4D;

{ TModelServicesRegister }

constructor TModelServicesRegister.Create;
begin
  RegisterAWS;
  RegisterGoogleAPI;
end;

destructor TModelServicesRegister.Destroy;
begin

  inherited;
end;

procedure TModelServicesRegister.RegisterAWS;
begin
  TBind4D
    .New
      .AWSService
        .Credential
          .AccountKey('')
          .AccountName('')
          .StorageEndPoint('')
          .Bucket('')
        .&End;
end;

procedure TModelServicesRegister.RegisterGoogleAPI;
begin
  TBind4D.New
    .Translator
      .Google
        .Credential
          .Key('SUA CHAVE GOOGLE API')
        .&End


        .Options
          .Cache(True)
        .&End
        .Params
          .Source('pt')
          .Target('pt')
        .&End;
end;

initialization
  aServicesRegister := TModelServicesRegister.Create;

finalization
  aServicesRegister.Free;

end.
