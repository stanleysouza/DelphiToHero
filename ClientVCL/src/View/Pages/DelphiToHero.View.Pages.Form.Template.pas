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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  DelphiToHero.View.Styles.Colors,
  RESTRequest4D,
  Vcl.WinXPanels, DelphiToHero.Model.DAO.Interfaces;

type
  TTypeOperation = (toNull, toPost, toPut);

  TFormTemplate = class(TForm, iRouter4DComponent)
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

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_C1, FONT_NAME1)]
    pnlBottonTool: TPanel;

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
    DataSource1: TDataSource;
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
    procedure btnExcluirClick(Sender: TObject);
    procedure restOperationPost;
    procedure restOperationPut;
  private
    { Private declarations }
    FTypeOperation : TTypeOperation;
    FEndpoint : string;
    FPK : String;
    FTitle : String;
    FSort, FOrder : string;
    FDAO : iDAOInterface;
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
  System.JSON,
  DelphiToHero.Model.DAO.Rest;

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
  FTypeOperation := toPut;
  TBind4D
    .New
      .Form(Self)
      .BindDataSetToForm(FDAO.DataSet);
  AlterListForm;
end;

procedure TFormTemplate.FormCreate(Sender: TObject);
begin
  FTypeOperation := toNull;
  FDAO := TDAOREST.new(self).DataSource(DataSource1);
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
  FDAO.Get;
  formatList;
end;

function TFormTemplate.Render: TForm;
begin
  Result := Self;
end;

procedure TFormTemplate.restOperationPost;
begin
  FDAO.Post;
  GetEndPoint;
  AlterListForm;
  FTypeOperation := null;
end;

procedure TFormTemplate.restOperationPut;
begin
  FDAO.Put;
  GetEndPoint;
  AlterListForm;
  FTypeOperation := null;
end;

procedure TFormTemplate.btnNovoClick(Sender: TObject);
begin
  FTypeOperation := toPost;
  AlterListForm;
  TBind4D.New.Form(self).ClearFieldForm;
end;

procedure TFormTemplate.btnSalvarClick(Sender: TObject);
begin
   case FTypeOperation of
    toPost : restOperationPost;
    toPut : restOperationPut;
  end;
end;

procedure TFormTemplate.btnExcluirClick(Sender: TObject);
begin
  FDAO.Delete;
  GetEndPoint;
  AlterListForm;
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
  TBind4D.New.Form(self).BindFormatListDataSet(FDAO.DataSet, DBGrid1);
end;

procedure TFormTemplate.AlterListForm;
begin
  pnlMainBodyDataForm.Visible := not pnlMainBodyDataForm.Visible;
  DBGrid1.Visible := not DBGrid1.Visible;
end;



end.
