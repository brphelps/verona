

module {
  verona.class @C {
  }
  verona.class @D {
    verona.field "f" : !verona.U64
    verona.field "g" : !verona.U64
  }
  func @bar() -> !verona.U64 {
    %0 = verona.new_region @C [] : !verona.U64
    %1 = verona.view %0 : !verona.U64 -> !verona.U64
    %2 = verona.new_object @D ["f", "g"](%1, %1 : !verona.U64, !verona.U64) in(%0 : !verona.U64) : !verona.S64
    %3 = verona.field_read %2["f"] : !verona.S64 -> !verona.U64
    %4 = verona.field_write %2["g"], %3 : !verona.S64 -> !verona.U64 -> !verona.U64
    verona.tidy %0 : !verona.U64
    verona.drop %0 : !verona.U64
    %5 = verona.new_region @C [] : !verona.U64
    return %5 : !verona.U64
  }
}