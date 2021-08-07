unit DelphiToHero.View.Pages.Form.Template;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Router4D.Interfaces,
  Vcl.StdCtrls,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Buttons,
  Bind4D,
  Bind4D.Attributes,
  Bind4D.Types,
  Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Grids,
  Vcl.DBGrids,
  DelphiToHero.View.Styles.Colors,
  RESTRequest4D, Vcl.WinXPanels;

type
  TFormTemplate = class(TForm, iRouter4DComponent)
//  pnlPrincipal.Color := COLOR_BACKGROUND;
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    pnlPrincipal: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_C1, FONT_NAME1)]
    pnlTop: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_C1, FONT_NAME1)]
    pnlMain: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_C1, FONT_NAME1)]
    pnlTopBody: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_C1, FONT_NAME1)]
    pnlMainBody: TPanel;

    [ComponentBindStyle(COLOR_C2, FONT_H5, COLOR_C1, FONT_NAME1)]
    pnlMainBodyTopLine: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_C1, FONT_NAME1)]
    pnlMainBodyTopMenu: TPanel;

    [ComponentBindStyle(COLOR_C2, FONT_H5, COLOR_C1, FONT_NAME1)]
    PnlMainTopBodySearchLine: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_C2, FONT_NAME1)]
    pnlMainBodyData: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_C1, FONT_NAME1)]
    pnlMainBodyDataForm: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_C1, FONT_NAME1)]
    pnlMainTopBodySearch: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_C1, FONT_NAME1)]
    pnlMainBodyTop: TPanel;

    [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR2, FONT_NAME1)]
    lblTitle: TLabel;

    [ComponentBindStyle(clBtnFace, FONT_H6, FONT_COLOR2, FONT_NAME1)]
    lblSearch: TLabel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_BACKGROUND_TOP, FONT_NAME1)]
    edtSearch: TEdit;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR4, FONT_NAME1)]
    DBGrid1: TDBGrid;

    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME1)]
    SpeedButton1: TSpeedButton;
    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME1)]
    SpeedButton2: TSpeedButton;
    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME1)]
    SpeedButton3: TSpeedButton;
    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME1)]
    SpeedButton4: TSpeedButton;
    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME1)]
    btnAtualizar: TSpeedButton;
    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME1)]
    btnNovo: TSpeedButton;
    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME1)]
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnFechar: TSpeedButton;
    btnExcluir: TSpeedButton;
    StackPanel1: TStackPanel;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FEndpoint : string;
    FPK : String;
    FTitle : String;
    FSort, FOrder : string;
    procedure AppStyle;
    procedure GetEndPoint;
    procedure AlterListForm;
    procedure formatList;
  public
    { Public declarations }
    function Render : TForm;
    procedure UnRender;
  end;

var
  FormTemplate: TFormTemplate;

implementation

uses
  System.JSON;

{$R *.dfm}

{ TForm1 }

procedure TFormTemplate.AppStyle;
begin
  pnlMainBodyDataForm.Visible := false;
  pnlMainBodyDataForm.Align := alClient;
  lblTitle.Caption := FTitle;
  DBGrid1.titleFont.Size := FONT_H6;
  DBGrid1.titleFont.color := FONT_COLOR4;
  DBGrid1.titleFont.name := 'Seagoe UI';
end;

procedure TFormTemplate.DBGrid1DblClick(Sender: TObject);
begin
  TBind4D.New.Form(Self).BindDataSetToForm(FDMemTable1);
  AlterListForm;
end;

procedure TFormTemplate.FormCreate(Sender: TObject);
begin
  TBind4D
    .New
      .Form(self)
      .BindFormDefault(FTitle)
      .BindFormRest(FEndpoint,FPK, FSort, FOrder)
      .SetStyleComponents;
  AppStyle;
end;

procedure TFormTemplate.FormResize(Sender: TObject);
begin
GetEndPoint;
end;

procedure TFormTemplate.GetEndPoint;
begin
TRequest
  .New
    .BaseURL('http://localhost:9000' + FEndpoint)
    .Accept('application/json')
    .DataSetAdapter(FDMemTable1)
    .Get;
  formatList;
end;

function TFormTemplate.Render: TForm;
begin
  Result := Self;
end;

procedure TFormTemplate.btnNovoClick(Sender: TObject);
begin
  AlterListForm;
  TBind4D.New.Form(self).ClearFieldForm;
end;

procedure TFormTemplate.btnSalvarClick(Sender: TObject);
var
  aJson : TJsonObject;
  aTeste : string;
begin
  aJson := TBind4D.new.Form(self).FormToJson(fbPost);
  aTeste := aJson.ToString;
  try
  TRequest
    .New
      .BaseURL('http://localhost:9000' + FEndpoint)
      .Accept('application/json')
      .AddBody(aJson.toString)
    .Post;
  finally
    aJson.Free;
  end;
  AlterListForm;
  GetEndPoint;
end;

procedure TFormTemplate.btnFecharClick(Sender: TObject);
begin
  AlterListForm;

end;

procedure TFormTemplate.UnRender;
begin
//
end;

procedure TFormTemplate.formatList;
begin
  TBind4D.New.Form(self).BindFormatListDataSet(FDMemTable1, DBGrid1);
end;

procedure TFormTemplate.AlterListForm;
begin
  pnlMainBodyDataForm.Visible := not pnlMainBodyDataForm.Visible;
  DBGrid1.Visible := not DBGrid1.Visible;
end;



end.
