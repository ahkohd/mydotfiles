;; extends 

(("const" @keyword) (#set! conceal "~"))
(("let" @keyword) (#set! conceal "~"))
(("var" @keyword) (#set! conceal "~"))
(("import" @keyword) (#set! conceal ""))
(("function" @keyword) (#set! conceal "󰊕"))
(("export" @keyword) (#set! conceal ""))
(("return" @keyword) (#set! conceal ""))
(("from" @keyword) (#set! conceal ""))
(((identifier) @react.React (#eq? @react.React "React")) (#set! conceal "󰜈"))
(("=>" @arrow.function) (#set! conceal "󰘧"))
; ((identifier) @react.use_prefix (#match? @react.use_prefix "^use[A-Z]"))
