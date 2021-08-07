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
  Vcl.StdCtrls,
  Bind4D,
  Bind4D.Attributes,
  Bind4D.Types,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Buttons,
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
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ComCtrls;

type
  [FormRest('/users','guuid','name', 'asc')]
  [FormDefault('Cadastro de Usuários')]
  TPageUsuarios = class(TFormTemplate)
    [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    Label1: TLabel;
    [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    Label3: TLabel;
    [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    Label2: TLabel;
    [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    Label4: TLabel;
    [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    Label5: TLabel;
    [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    Label6: TLabel;
    [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    Label7: TLabel;
    [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    Label8: TLabel;
    [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    Label9: TLabel;

    [FieldJsonBind('guuid'), FbignorePost, FbIgnorePost]
    [FieldDataSetBind('guuid',ftString, false, 0, 'Codigo')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    edtCodigo: TEdit;

    [FieldJsonBind('name')]
    [FieldDataSetBind('name',ftString, True, 25, 'Nome')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    edtName: TEdit;

    [FieldJsonBind('phone')]
    [FieldDataSetBind('phone',ftString, True, 15, 'Telefone', '!\(##\) #####-####;0;_')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1, teCell)]
    [ComponentBindFormat(teCELL)]
    EdtPhone: TEdit;

    [FieldJsonBind('occupation')]
    [FieldDataSetBind('occupation',ftString, True, 10, 'Profissão')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    edtProfissao: TEdit;

    [FieldJsonBind('balance')]
    [FieldDataSetBind('balance',ftCurrency, True, 10, 'Saldo', 'R$ ###,###,##0.00', taLeftJustify)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1, tecoin)]
    [ComponentBindFormat(teCOIN)]
    edtSaldo: TEdit;

    [FieldJsonBind('birthdate')]
    [FieldDataSetBind('birthdate',ftDate, True, 8, 'Data Nasc', '##/##/####;0;_', taLeftJustify)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    DateBirth: TDateTimePicker;

    [FieldJsonBind('lasttransaction')]
    [FieldDataSetBind('lasttransaction',ftTime, True, 6, 'Ult. Trans', '##:##:##;0;_', taLeftJustify)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1)]
    TimeTrans: TDateTimePicker;

    [FieldJsonBind('cpf')]
    [FieldDataSetBind('cpf',ftString, True, 12, 'Cpf', '###.###.###-##;0;_', taLeftJustify)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1, teCPF)]
    [ComponentBindFormat(teCPF)]
    edtCPF: TEdit;

    [FieldJsonBind('cnpj')]
    [FieldDataSetBind('cnpj', ftString, True, 15, 'Cnpj', '##.###.###/####-##;0;_', taLeftJustify)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1, teCNPJ)]
    [ComponentBindFormat(teCNPJ)]
    edtCNPJ: TEdit;

    [FieldJsonBind('idoccupation'), FbignorePost, FbIgnorePost]
    [FieldDataSetBind('idoccupation',ftString, False, 10, 'IDOcupation')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1)]
     Edit1: TEdit;

    [FieldJsonBind('picture'), FbignorePost, FbIgnorePost]
    [FieldDataSetBind('picture',ftString, False, 10, 'Imagem')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME1)]

    StackPanel2: TStackPanel;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageUsuarios: TPageUsuarios;

implementation

{$R *.dfm}

end.
