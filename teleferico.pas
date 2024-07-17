unit teleferico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Math, Vcl.Samples.Gauges, Vcl.ColorGrd;

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
    Label5: TLabel;
    Label6: TLabel;
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

  ProfessoresDestino: Integer;
  ProfessoresInicio: Integer;

  ViagensEstudantes: Integer;


begin

  ProfessoresDestino := 0;
  ProfessoresInicio := 0;

  ViagensEstudantes := 0;

  var ViagensIda : Integer := 0;
  var ViagensVolta : Integer := 0;

  if RadioGroup1.ItemIndex = -1 then
  begin

    ShowMessage('Por favor, selecione uma operação');

  end
  else
  begin

      try
        Estudantes := StrtoInt(Edit1.Text);
        ProfessoresInicio := StrtoInt(Edit2.Text);
      except
        ShowMessage('Por favor, digite números válidos.');
        Estudantes := 0;
      end;

      while Estudantes > 0 do
      begin

      var ProfTemp : Integer := 0;

        if ProfessoresInicio > 0 then
        begin
          Dec(ProfessoresInicio);
          Inc(ProfessoresDestino);
          Estudantes := Estudantes - 9;
          Inc(ViagensIda);

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

          if ProfTemp > ProfessoresDestino then
          begin
            ProfessoresInicio := ProfessoresInicio + ProfessoresDestino;
            ProfessoresDestino := 0;
          end
          else
          begin
            ProfessoresInicio := ProfessoresInicio + ProfTemp;
            ProfessoresDestino := ProfessoresDestino - ProfTemp;
          end;

          Inc(ViagensVolta);
        end;

        ViagensEstudantes := Ceil(Estudantes / 9);

      end;


  end;

  if RadioGroup1.ItemIndex = 0 then
  begin
    Label5.Caption := 'Viagens de Subida: ' + InttoStr(ViagensIda);
    Label6.Caption := 'Viagens de Descida: ' + InttoStr(ViagensVolta);
  end
  else
  begin
    Label5.Caption := 'Viagens de Subida: ' + InttoStr(ViagensVolta);
    Label6.Caption := 'Viagens de Descida: ' + InttoStr(ViagensIda);
  end;



  Label4.Caption := 'Total de Viagens Necessárias: ' + InttoStr(ViagensIda + ViagensVolta);


end;


end.

