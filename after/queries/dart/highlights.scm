;; extends
;;
;; Quebra uma anotacao de tipo em partes coloriveis separadamente.
;;
;; A query base do nvim-treesitter da a MESMA captura (@type) pro tipo externo
;; e pros argumentos genericos, entao `List<String>` sai todo de uma cor so.
;; Confirmado na arvore do tree-sitter-dart:
;;
;;   declaration "List<String>? foo"
;;     type_identifier  "List"          <- @type
;;     type_arguments   "<String>"
;;       type_identifier "String"       <- @type  (mesma captura!)
;;     nullable_type    "?"             <- @punctuation.delimiter
;;
;; Capturas que casam depois vencem as anteriores, entao basta re-capturar os
;; nos mais especificos com um nome proprio. As cores ficam no colorscheme
;; (colors/dartpad.lua): @type.argument e @type.nullable.

; argumento generico: o String em List<String>
(type_arguments
  (type_identifier) @type.argument)

; o marcador de nulabilidade
(nullable_type
  "?" @type.nullable)
