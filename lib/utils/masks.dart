import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Masks {
  Masks._();

  static Masks instance = Masks._();

  MaskTextInputFormatter phoneNumber() {
    return MaskTextInputFormatter(
      mask: '+(998) ## ###-##-##',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
      type: MaskAutoCompletionType.lazy,
    );
  }
}
