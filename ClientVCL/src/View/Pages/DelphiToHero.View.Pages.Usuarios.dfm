inherited PageUsuarios: TPageUsuarios
  Caption = 'Usuarios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPrincipal: TPanel
    inherited pnlTop: TPanel
      inherited pnlTopBody: TPanel
        inherited lblTitle: TLabel
          Height = 65
        end
      end
    end
    inherited pnlMain: TPanel
      inherited pnlMainBody: TPanel
        inherited pnlMainBodyTop: TPanel
          inherited pnlMainBodyTopMenu: TPanel
            inherited pnlMainTopBodySearch: TPanel
              inherited lblSearch: TLabel
                Width = 420
              end
            end
          end
        end
        inherited pnlMainBodyData: TPanel
          inherited pnlMainBodyDataForm: TPanel
            Left = 128
            Width = 884
            Padding.Top = 25
            ExplicitLeft = 128
            ExplicitWidth = 884
            inherited pnlBottonTool: TPanel
              Width = 834
              ExplicitWidth = 834
              inherited btnSalvar: TSpeedButton
                Left = 554
                ExplicitLeft = 554
              end
              inherited btnFechar: TSpeedButton
                Left = 694
                ExplicitLeft = 694
              end
            end
            inherited StackPanel1: TStackPanel
              Top = 25
              Width = 320
              Height = 327
              Align = alLeft
              ControlCollection = <
                item
                  Control = Label1
                end
                item
                  Control = edtCodigo
                end
                item
                  Control = Label3
                end
                item
                  Control = edtName
                end
                item
                  Control = Label2
                end
                item
                  Control = EdtPhone
                end
                item
                  Control = Label4
                end
                item
                  Control = edtProfissao
                end
                item
                  Control = Label6
                end
                item
                  Control = edtSaldo
                end>
              HorizontalPositioning = sphpFill
              Padding.Left = 15
              Padding.Right = 15
              Spacing = 5
              ExplicitTop = 25
              ExplicitWidth = 320
              ExplicitHeight = 327
              object Label1: TLabel
                Left = 15
                Top = 0
                Width = 290
                Height = 13
                Caption = 'Codigo'
              end
              object edtCodigo: TEdit
                Left = 15
                Top = 18
                Width = 290
                Height = 21
                TabOrder = 0
              end
              object Label3: TLabel
                Left = 15
                Top = 44
                Width = 290
                Height = 13
                Caption = 'Nome'
              end
              object edtName: TEdit
                Left = 15
                Top = 62
                Width = 290
                Height = 21
                TabOrder = 1
              end
              object Label2: TLabel
                Left = 15
                Top = 88
                Width = 290
                Height = 13
                Caption = 'Telefone'
              end
              object EdtPhone: TEdit
                Left = 15
                Top = 106
                Width = 290
                Height = 21
                TabOrder = 2
              end
              object Label4: TLabel
                Left = 15
                Top = 132
                Width = 290
                Height = 13
                Caption = 'Profiss'#227'o'
              end
              object edtProfissao: TEdit
                Left = 15
                Top = 150
                Width = 290
                Height = 21
                TabOrder = 3
              end
              object Label6: TLabel
                Left = 15
                Top = 176
                Width = 290
                Height = 13
                Caption = 'Saldo'
              end
              object edtSaldo: TEdit
                Left = 15
                Top = 194
                Width = 290
                Height = 21
                TabOrder = 4
              end
            end
            object StackPanel2: TStackPanel
              Left = 345
              Top = 25
              Width = 336
              Height = 327
              Align = alLeft
              BevelOuter = bvNone
              ControlCollection = <
                item
                  Control = Label5
                end
                item
                  Control = DateBirth
                end
                item
                  Control = Label7
                end
                item
                  Control = TimeTrans
                end
                item
                  Control = Label8
                end
                item
                  Control = edtCPF
                end
                item
                  Control = Label9
                end
                item
                  Control = edtCNPJ
                end
                item
                  Control = Edit1
                end>
              HorizontalPositioning = sphpFill
              Padding.Left = 15
              Padding.Right = 15
              Spacing = 5
              TabOrder = 2
              object Label5: TLabel
                Left = 15
                Top = 0
                Width = 306
                Height = 13
                Caption = 'Data de Nascimento'
              end
              object DateBirth: TDateTimePicker
                Left = 15
                Top = 18
                Width = 306
                Height = 21
                Date = 44415.000000000000000000
                Time = 0.434843564813491000
                TabOrder = 0
              end
              object Label7: TLabel
                Left = 15
                Top = 44
                Width = 306
                Height = 13
                Caption = 'Ultima Tansa'#231#227'o'
              end
              object TimeTrans: TDateTimePicker
                Left = 15
                Top = 62
                Width = 306
                Height = 21
                Date = 44415.000000000000000000
                Time = 0.434843564813491000
                Kind = dtkTime
                TabOrder = 1
              end
              object Label8: TLabel
                Left = 15
                Top = 88
                Width = 306
                Height = 13
                Caption = 'CPF'
              end
              object edtCPF: TEdit
                Left = 15
                Top = 106
                Width = 306
                Height = 21
                TabOrder = 2
              end
              object Label9: TLabel
                Left = 15
                Top = 132
                Width = 306
                Height = 13
                Caption = 'CNPJ'
              end
              object edtCNPJ: TEdit
                Left = 15
                Top = 150
                Width = 306
                Height = 21
                TabOrder = 3
              end
              object Edit1: TEdit
                Left = 15
                Top = 176
                Width = 306
                Height = 21
                TabOrder = 4
                Visible = False
              end
            end
          end
          inherited DBGrid1: TDBGrid
            Width = 128
          end
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    Left = 1032
    Top = 320
  end
end
