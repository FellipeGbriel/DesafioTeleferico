unit teleferico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

var

  Estudantes: Integer;

  ProfessoresCima: Integer;
  ProfessoresBaixo: Integer;

  ViagensEstudantes: Integer;


begin

  Estudantes := 0;

  ProfessoresCima := 0;
  ProfessoresBaixo := 0;

  ViagensEstudantes := 0;

  var Contador := 0;

  if RadioGroup1.ItemIndex = -1 then
  begin

    ShowMessage('Por favor, selecione uma operação');

  end
  else if RadioGroup1.ItemIndex = 0 then
  begin

      try
        Estudantes := StrtoInt(Edit1.Text);
        ProfessoresBaixo := StrtoInt(Edit2.Text);
      except
        ShowMessage('Por favor, digite números válidos.');
        Estudantes := 0;
      end;

      while Estudantes > 0 do
      begin

      var ProfTemp : Integer := 0;

        if ProfessoresBaixo > 0 then
        begin
          ProfessoresBaixo := ProfessoresBaixo - 1;
          ProfessoresCima := ProfessoresCima + 1;
          Estudantes := Estudantes - 9;

        end
        else
        begin
          case ViagensEstudantes of
            1: ProfTemp := 1;
            2: ProfTemp := 2;
            3: ProfTemp := 3;
            4: ProfTemp := 4;
            5: ProfTemp := 5;
            6: ProfTemp := 6;
            7: ProfTemp := 7;
            8: ProfTemp := 8;
            9: ProfTemp := 9;
          end;
          if ViagensEstudantes > 9 then
          begin
            ProfTemp := 10;
          end;

          if ProfTemp > ProfessoresCima then
          begin
            ProfessoresBaixo := ProfessoresBaixo + ProfessoresCima;
            ProfessoresCima := 0;
          end
          else
          begin
            ProfessoresBaixo := ProfessoresBaixo + ProfTemp;
            ProfessoresCima := ProfessoresCima - ProfTemp;
          end;

        end;

        ViagensEstudantes := Ceil(Estudantes / 9);
        Inc(Contador);
      end;


  end
  else
  begin

    try
      Estudantes := StrtoInt(Edit1.Text);
      ProfessoresCima := StrtoInt(Edit2.Text);
    except
      ShowMessage('Por favor, digite números válidos.');
      Estudantes := 0;
    end;

      while Estudantes > 0 do
      begin

      var ProfTemp : Integer := 0;

        if ProfessoresCima > 0 then
        begin
          ProfessoresCima := ProfessoresCima - 1;
          ProfessoresBaixo := ProfessoresBaixo + 1;
          Estudantes := Estudantes - 9;

        end
        else
        begin
          case ViagensEstudantes of
            1: ProfTemp := 1;
            2: ProfTemp := 2;
            3: ProfTemp := 3;
            4: ProfTemp := 4;
            5: ProfTemp := 5;
            6: ProfTemp := 6;
            7: ProfTemp := 7;
            8: ProfTemp := 8;
            9: ProfTemp := 9;
          end;
          if ViagensEstudantes > 9 then
          begin
            ProfTemp := 10;
          end;

          if ProfTemp > ProfessoresBaixo then
          begin
            ProfessoresCima := ProfessoresCima + ProfessoresBaixo;
            ProfessoresBaixo := 0;
          end
          else
          begin
            ProfessoresCima := ProfessoresCima + ProfTemp;
            ProfessoresBaixo := ProfessoresBaixo - ProfTemp;
          end;

        end;

        ViagensEstudantes := Ceil(Estudantes / 9);
        Inc(Contador);
      end;
  end;

  Label4.Caption := 'Viagens Necessárias: ' + InttoStr(Contador);

end;


end.
