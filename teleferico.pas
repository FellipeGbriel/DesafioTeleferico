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
  // Variáveis para armazenar o número de estudantes e professores
  Estudantes: Integer;
  ProfessoresDestino: Integer;
  ProfessoresInicio: Integer;

  // Variável para contar o número de viagens dos estudantes
  ViagensEstudantes: Integer;

begin
  // Inicializa as variáveis
  ProfessoresDestino := 0;
  ProfessoresInicio := 0;
  ViagensEstudantes := 0;

  // Variáveis para contar as viagens de ida e volta
  var ViagensIda : Integer := 0;
  var ViagensVolta : Integer := 0;

  // Verifica se o usuário selecionou uma operação
  if RadioGroup1.ItemIndex = -1 then
  begin
    ShowMessage('Por favor, selecione uma operação');
  end
  else
  begin
    // Tenta converter as entradas do usuário para inteiros
    try
      Estudantes := StrtoInt(Edit1.Text);
      ProfessoresInicio := StrtoInt(Edit2.Text);
    except
      ShowMessage('Por favor, digite números válidos.');
      Estudantes := 0;
    end;

    // Loop para calcular o número de viagens
    while Estudantes > 0 do
    begin
      // Variável temporária para armazenar o número de professores que vão na viagem
      var ProfTemp : Integer := 0;

      // Verifica se há professores no início
      if ProfessoresInicio > 0 then
      begin
        // Diminui o número de professores no início e aumenta o número no destino
        Dec(ProfessoresInicio);
        Inc(ProfessoresDestino);
        // Diminui o número de estudantes e aumenta o número de viagens de ida
        Estudantes := Estudantes - 9;
        Inc(ViagensIda);
      end
      else
      begin
        // Define o número de professores que vão na viagem de volta, de acordo com o número de viagens dos estudantes
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
        // Se o número de viagens dos estudantes for maior que 9, envia 10 professores
        if ViagensEstudantes > 9 then
        begin
          ProfTemp := 10;
        end;

        // Verifica se o número de professores a serem enviados é maior que o número de professores no destino
        if ProfTemp > ProfessoresDestino then
        begin
          // Se sim, envia todos os professores do destino para o início
          ProfessoresInicio := ProfessoresInicio + ProfessoresDestino;
          ProfessoresDestino := 0;
        end
        else
        begin
          // Se não, envia os professores do destino para o início
          ProfessoresInicio := ProfessoresInicio + ProfTemp;
          ProfessoresDestino := ProfessoresDestino - ProfTemp;
        end;

        // Aumenta o número de viagens de volta
        Inc(ViagensVolta);
      end;

      // Calcula o número de viagens dos estudantes
      ViagensEstudantes := Ceil(Estudantes / 9);
    end;
  end;

  // Exibe o número de viagens de ida e volta, dependendo da operação selecionada
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

  // Exibe o número total de viagens
  Label4.Caption := 'Total de Viagens Necessárias: ' + InttoStr(ViagensIda + ViagensVolta);
end;

end.

