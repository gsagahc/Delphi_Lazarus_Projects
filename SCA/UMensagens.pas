unit UMensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TMyButtons = (mbSim, mbNao, mbOk);

type
  TFrmMensagens = class(TForm)
    PnIcones: TPanel;
    imgErro: TImage;
    imgDeletar: TImage;
    imgCuidado: TImage;
    ImgInformacao: TImage;
    imgQuestao: TImage;
    PnBotoes: TPanel;
    PnMessagem: TPanel;
    BtOK: TBitBtn;
    BTSim: TBitBtn;
    BtNao: TBitBtn;
    LbMensagem: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function Mensagem(Texto: String; Tipo: Char; Botoes: array of TMyButtons): Boolean;
  end;

var
  FrmMensagens: TFrmMensagens;
  const
    LEFTBUTTONS : array[0..2] of integer = (258, 178, 97);
    TITULO :String = 'Mensagem';

implementation

{$R *.dfm}

class function TFrmMensagens.Mensagem(Texto: String; Tipo: Char;
  Botoes: array of TMyButtons): Boolean;
var
  i: Integer;
  frm :TfrmMensagens;
begin
  frm := TfrmMensagens.Create(nil);
  try
    frm.lbMensagem.Caption := Texto;
    frm.Caption := TITULO;

    for i:=0 to Length(Botoes)-1 do
    begin
      case (Botoes[i]) of
        mbOk: begin
                frm.BtOK.Visible := True;
                frm.BtOK.Left := LEFTBUTTONS[i];
              end;

        mbSim: begin
                 frm.btSim.Visible := True;
                 frm.btSim.Left := LEFTBUTTONS[i];
               end;

        mbNao: begin
                 frm.BtNao.Visible := True;
                 frm.BtNao.Left := LEFTBUTTONS[i];
               end;

        else begin
          frm.BtOK.Visible := True;
          frm.BtOK.Left := LEFTBUTTONS[i];
        end;
      end;
    end;

     case (Tipo) of
      'I': frm.imgInformacao.Visible := True;
      'D': frm.imgDeletar.Visible := True;
      'Q': frm.imgQuestao.Visible := True;
      'C': frm.imgCuidado.Visible := True;
      'E': frm.imgErro.Visible := True;
      else
        frm.imgInformacao.Visible := True;
    end;

     frm.ShowModal;

    case (frm.ModalResult) of
      mrOk, mrYes : result := True;
      else
        result := False;
    end;

  finally
    if (frm<>nil) then
      FreeAndNil(frm);
  end;

end;

end.
