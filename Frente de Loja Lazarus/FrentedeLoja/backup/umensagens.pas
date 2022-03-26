unit uMensagens;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls;
type
  TMyButtons = (mbSim, mbNao, mbOk);

type

  { TFormMensagens }

  TFormMensagens = class(TForm)
    ButtonSim: TButton;
    ButtonNao: TButton;
    ButtonOK: TButton;
    imgCuidado: TImage;
    imgDeletar: TImage;
    imgErro: TImage;
    imgInformacao: TImage;
    imgQuestao: TImage;
    LblMensagem: TLabel;
    PanelIcones: TPanel;
    pnlBotoes: TPanel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  private

  public
    class function Mensagem(Texto, Titulo: String; Tipo: Char; Botoes: array of TMyButtons): Boolean;
  end;

var
  FormMensagens: TFormMensagens;
const
  LEFTBUTTONS : array[0..2] of integer = (258, 178, 97);

implementation

{$R *.lfm}

{ TFormMensagens }

procedure TFormMensagens.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin

end;

class function TFormMensagens.Mensagem(Texto, Titulo: String; Tipo: Char;
  Botoes: array of TMyButtons): Boolean;
var
  I   :Integer;
  frm :TFormMensagens;
begin
   frm := TFormMensagens.Create(nil);
   try
     frm.lblMensagem.Caption := Texto;
     frm.Caption := TITULO;
    for i:=0 to Length(Botoes)-1 do
    begin
      case (Botoes[i]) of
        mbOk: begin
                frm.ButtonOK.Visible := True;
                frm.ButtonOK.Left := LEFTBUTTONS[i];
              end;

        mbSim: begin
                 frm.ButtonSim.Visible := True;
                 frm.ButtonSim.Left := LEFTBUTTONS[i];
               end;

        mbNao: begin
                 frm.ButtonNao.Visible := True;
                 frm.ButtonNao.Left := LEFTBUTTONS[i];
               end;

        else begin
          frm.ButtonOK.Visible := True;
          frm.ButtonOK.Left := LEFTBUTTONS[i];
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

