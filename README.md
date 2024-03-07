# MultiPay APP

## Como inserir um texto traduzido
[Link com a documentação de como funciona o package](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)

### Para adicionar um texto traduzido

1. Adicione o texto nos arquivos de cada idioma:
    lib/localization/lang_pt.arb
    lib/localization/lang_en.arb

2. Rode o comando ´flutter pub get´

3. Importe o arquivo gerado no arquivo em que deseja usar a tradução

´
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
´ 

4. Através da classe AppLocalizations você terá acesso a tradução criada.

Exemplo:
AppLocalizations.of(context).cellular

### Padrões de nomenclatura das chaves de tradução

1. Usar camelCase
2. Usar sempre no inglês