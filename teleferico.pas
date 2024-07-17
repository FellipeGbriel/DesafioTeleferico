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
  // Vari�veis para armazenar o n�mero de estudantes e professores
  Estudantes: Integer;
  ProfessoresDestino: Integer;
  ProfessoresInicio: Integer;

  // Vari�vel para contar o n�mero de viagens dos estudantes
  ViagensEstudantes: Integer;

begin
  // Inicializa as vari�veis
  ProfessoresDestino := 0;
  ProfessoresInicio := 0;
  ViagensEstudantes := 0;

  // Vari�veis para contar as viagens de ida e volta
  var ViagensIda : Integer := 0;
  var ViagensVolta : Integer := 0;

  // Verifica se o usu�rio selecionou uma opera��o
  if RadioGroup1.ItemIndex = -1 then
  begin
    ShowMessage('Por favor, selecione uma opera��o');
  end
  else
  begin
    // Tenta converter as entradas do usu�rio para inteiros
    try
      Estudantes := StrtoInt(Edit1.Text);
      ProfessoresInicio := StrtoInt(Edit2.Text);
    except
      ShowMessage('Por favor, digite n�meros v�lidos.');
      Estudantes := 0;
    end;

    // Loop para calcular o n�mero de viagens
    while Estudantes > 0 do
    begin
      // Vari�vel tempor�ria para armazenar o n�mero de professores que v�o na viagem
      var ProfTemp : Integer := 0;

      // Verifica se h� professores no in�cio
      if ProfessoresInicio > 0 then
      begin
        // Diminui o n�mero de professores no in�cio e aumenta o n�mero no destino
        Dec(ProfessoresInicio);
        Inc(ProfessoresDestino);
        // Diminui o n�mero de estudantes e aumenta o n�mero de viagens de ida
        Estudantes := Estudantes - 9;
        Inc(ViagensIda);
      end
      else
      begin
        // Define o n�mero de professores que v�o na viagem de volta, de acordo com o n�mero de viagens dos estudantes
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
        // Se o n�mero de viagens dos estudantes for maior que 9, envia 10 professores
        if ViagensEstudantes > 9 then
        begin
          ProfTemp := 10;
        end;

        // Verifica se o n�mero de professores a serem enviados � maior que o n�mero de professores no destino
        if ProfTemp > ProfessoresDestino then
        begin
          // Se sim, envia todos os professores do destino para o in�cio
          ProfessoresInicio := ProfessoresInicio + ProfessoresDestino;
          ProfessoresDestino := 0;
        end
        else
        begin
          // Se n�o, envia os professores do destino para o in�cio
          ProfessoresInicio := ProfessoresInicio + ProfTemp;
          ProfessoresDestino := ProfessoresDestino - ProfTemp;
        end;

        // Aumenta o n�mero de viagens de volta
        Inc(ViagensVolta);
      end;

      // Calcula o n�mero de viagens dos estudantes
      ViagensEstudantes := Ceil(Estudantes / 9);
    end;
  end;

  // Exibe o n�mero de viagens de ida e volta, dependendo da opera��o selecionada
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

  // Exibe o n�mero total de viagens
  Label4.Caption := 'Total de Viagens Necess�rias: ' + InttoStr(ViagensIda + ViagensVolta);
end;

end.

