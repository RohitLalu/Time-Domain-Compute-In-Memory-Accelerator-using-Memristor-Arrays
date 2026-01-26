; Technology File sky130_tech_lib
; Generated on Jan 25 16:41:07 2026
;     with @(#)$CDS: virtuoso version 6.1.8-64b 11/15/2022 19:45 (cpgbld01) $


;********************************
; CONTROLS
;********************************
controls(
 techVersion("1.0")

) ;controls


;********************************
; LAYER DEFINITION
;********************************
layerDefinitions(

  ;-- Masterslices --
  ( "nwell"    64   20 )
  ( "diff"     65   20 )
  ( "poly"     66   20 )

  ;-- Interconnects --
  ( "li1"      67   20 )  ; Local Interconnect (Critical!)
  ( "met1"     68   20 )
  ( "met2"     69   20 )
  ( "met3"     70   20 )
  ( "met4"     71   20 )
  ( "met5"     72   20 )

  ;-- Vias (Drawing Purpose) --
  ( "mcon"     67   44 )  ; Connection between li1 and met1 (often layer 67:44)
  ( "via1"     68   44 )  ; Between met1 and met2
  ( "via2"     69   44 )  ; Between met2 and met3
  ( "via3"     70   44 )
  ( "via4"     71   44 )

  ;-- Pins (System Purposes) --
  ( "met1_pin" 68   16 )
  ( "met2_pin" 69   16 )
  ( "li1_pin"  67   16 )

  ;-- Text/Labels --
  ( "text"     81   44 )

) ;layerDefinitions
