;-------------------------------------------------------------------------------
;
; Maintainer: superzanti
; Feature Reference: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
;-------------------------------------------------------------------------------
;

; Parameters

(association_element) @parameter.inner
(interface_declaration) @parameter.inner
(association_or_range_list (simple_range) @parameter.inner @parameter.outer)

(association_list
 ("," @parameter.outer . (association_element) @parameter.outer)
)

(association_or_range_list
 ("," @parameter.outer . (association_element) @parameter.outer)
)

(association_list
 .
 (association_element) @parameter.outer
 ","? @parameter.outer
)

(association_or_range_list
 .
 (association_element) @parameter.outer
 [","? ";"?] @parameter.outer
)

(interface_list
 (";" @parameter.outer . (interface_declaration) @parameter.outer)
)

(interface_list
 .
 (interface_declaration) @parameter.outer
 ";"? @parameter.outer
)
