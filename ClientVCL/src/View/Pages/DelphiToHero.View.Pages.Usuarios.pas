unit DelphiToHero.View.Pages.Usuarios;

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
  DelphiToHero.View.Pages.Form.Template,
  Vcl.ExtCtrls,
  Bind4D,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Buttons,
  Vcl.StdCtrls,
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
  Vcl.Grids,
  DelphiToHero.View.Styles.Colors,
  Vcl.DBGrids,
  Vcl.WinXPanels,
  Vcl.ComCtrls,
  Bind4D.Attributes,
  Bind4D.Types;

type
  [FormRest('/users', 'guuid', 'name', 'asc')]
  [FormDefault('Cadastro de Usuários')]
  TPageUsuarios = class(TFormTemplate)
    StackPanel1: TStackPanel;

    [ComponentBindStyle(clBtnFace, FONT_H6, FONT_COLOR3, FONT_NAME)]
    [Translation('Códigoo')]
    lblCodigo: TLabel;

    [ComponentBindStyle(clBtnFace, FONT_H6, FONT_COLOR3, FONT_NAME)]
    [Translation('Nome')]
    lblNome: TLabel;

    [FieldJsonBind('guuid'), FbIgnorePost, FbIgnorePut]
    [FieldDataSetBind('guuid', ftString, False, 0, 'Código')]
    [Translation('Código')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtCodigo: TEdit;

    [FieldJsonBind('name')]
    [FieldDataSetBind('name', ftString, True, 25, 'Nome')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    [Translation('Nome')]
    //[fvNotNull('O Campo Nome não pode ser Vazio',FONT_COLOR3)]
    edtName: TEdit;

    [ComponentBindStyle(clBtnFace, FONT_H6, FONT_COLOR3, FONT_NAME)]
    [Translation('Telefone')]
    lblTelefone: TLabel;

    [FieldJsonBind('phone')]
    [FieldDataSetBind('phone', ftString, True, 10, 'Telefone', '!\(##\) #####-####;0;_', taLeftJustify, 700)]
    [Translation('Telefone')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCell)]
    [ComponentBindFormat(teCell)]
    edtPhone: TEdit;

    [ComponentBindStyle(clBtnFace, FONT_H6, FONT_COLOR3, FONT_NAME)]
    [Translation('Profissão')]
    lblProfissao: TLabel;

    [FieldJsonBind('occupation')]
    [FieldDataSetBind('occupation', ftString, True, 12, 'Profissão', '', taLeftJustify, 1000)]
    [Translation('Profissão')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtProfissao: TEdit;

    [ComponentBindStyle(clBtnFace, FONT_H6, FONT_COLOR3, FONT_NAME)]
    [Translation('Saldo')]
    lblSaldo: TLabel;

    [FieldJsonBind('balance')]
    [FieldDataSetBind('balance', ftCurrency, True, 10, 'Saldo', 'R$ ###,###,##0.00', taLeftJustify, 500)]
    [Translation('Saldo')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCoin)]
    [ComponentBindFormat(teCOIN)]
    edtSaldo: TEdit;

    [ComponentBindStyle(clBtnFace, FONT_H6, FONT_COLOR3, FONT_NAME)]
    [Translation('Data de Nascimento')]
    lblDataNascimento: TLabel;

    [FieldJsonBind('birthdate')]
    [FieldDataSetBind('birthdate', ftDate, True, 8, 'Data Nasc', '##/##/####;0;_', taLeftJustify, 1150)]
    [Translation('Data Nascimento')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    dateBirth: TDateTimePicker;

    [ComponentBindStyle(clBtnFace, FONT_H6, FONT_COLOR3, FONT_NAME)]
    [Translation('Ultima Transação')]
    lblUltimaTransacao: TLabel;

    [FieldJsonBind('lasttransaction')]
    [FieldDataSetBind('lasttransaction', ftTime, True, 7, 'Ult. Trans', '##:##:##;0;_', taLeftJustify, 1250)]
    [Translation('Ultima Transação')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    timeTrans: TDateTimePicker;

    [ComponentBindStyle(clBtnFace, FONT_H6, FONT_COLOR3, FONT_NAME)]
    Label8: TLabel;

    [FieldJsonBind('cpf')]
    [FieldDataSetBind('cpf', ftString, True, 15, 'CPF', '###.###.###-##;0;_', taLeftJustify, 800)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCPF)]
    [ComponentBindFormat(teCPF)]
    edtCPF: TEdit;

    [ComponentBindStyle(clBtnFace, FONT_H6, FONT_COLOR3, FONT_NAME)]
    Label9: TLabel;

    [FieldJsonBind('cnpj')]
    [FieldDataSetBind('cnpj', ftString, True, 15, 'CNPJ', '##.###.###/####-##;0;_', taLeftJustify, 1400)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCNPJ)]
    [ComponentBindFormat(teCNPJ)]
    edtCNPJ: TEdit;

    StackPanel2: TStackPanel;
    [FieldJsonBind('idoccupation'), FbignorePost, FbIgnorePost]
    [FieldDataSetBind('idoccupation',ftString, False, 0, 'IDOcupation')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
     pnlImageData: TPanel;





    [FieldJsonBind('picture')]
    [FieldDataSetBind('picture', ftString, False)]
    //[S3Storage('jpg', 'image/jpeg')]
    //[ImageAttribute('JpgImage_1')]
    Image1: TImage;


  private
    { Private declarations }
  public
      //constructor Create(AOwner: TComponent); override;
    { Public declarations }
  end;

var
  PageUsuarios: TPageUsuarios;

implementation

{$R *.dfm}

end.
