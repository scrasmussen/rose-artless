pp-aterm -i do_concurrent_0.f90.aterm
Program(
  no-comments(){Location(1, 1, 1, 1)}
, [ MainProgram(
      ProgramStmt(no-label(){Location(1, 1, 1, 1)}, "doconcurrent_0"{Location(1, 9, 1, 23)}, eos("\n  "{Location(1, 23, 2, 3)}){Location(1, 23, 2, 3)}){Location(1, 1, 2, 3)}
    , InitialSpecPart([], []){Location(2, 3, 2, 3)}
    , SpecAndExecPart(
        [ TypeDeclarationStmt(
            no-label(){Location(2, 3, 2, 3)}
          , IntrinsicType(INTEGER(){Location(2, 3, 2, 10)}){Location(2, 3, 2, 10)}
          , no-list(){Location(2, 11, 2, 11)}
          , [EntityDecl("i"{Location(2, 14, 2, 15)}, no-list(){Location(2, 15, 2, 15)}, no-list(){Location(2, 15, 2, 15)}, no-char-length(){Location(2, 15, 2, 15)}, no-init(){Location(2, 15, 2, 15)}){Location(2, 14, 2, 15)}]
          , eos("\n  "{Location(2, 15, 3, 3)}){Location(2, 15, 3, 3)}
          ){Location(2, 3, 3, 3)}
        , NonlabelDoStmt(
            no-label(){Location(3, 3, 3, 3)}
          , no-name(){Location(3, 3, 3, 3)}
          , LoopConcurrentControl(
              ForallHeader(
                no-type-spec(){Location(3, 18, 3, 18)}
              , [ForallTripletSpec("i"{Location(3, 18, 3, 19)}, IntVal("1"{Location(3, 20, 3, 21)}){Location(3, 20, 3, 21)}, IntVal("4"{Location(3, 22, 3, 23)}){Location(3, 22, 3, 23)}, no-forall-step(){Location(3, 23, 3, 23)}){Location(3, 18, 3, 23)}]
              , no-mask-expr(){Location(3, 23, 3, 23)}
              ){Location(3, 17, 3, 24)}
            ){Location(3, 6, 3, 24)}
          , eos("\n     "{Location(3, 24, 4, 6)}){Location(3, 24, 4, 6)}
          ){Location(3, 3, 4, 6)}
        , PrintStmt(
            no-label(){Location(4, 6, 4, 6)}
          , STAR(){Location(4, 12, 4, 13)}
          , comma-list(
              ["\"i = \""{Location(4, 15, 4, 21)}, DataRef([PartRef("i"{Location(4, 23, 4, 24)}, no-section-subscripts(){Location(4, 24, 4, 24)}, no-image-selector(){Location(4, 24, 4, 24)}){Location(4, 23, 4, 24)}]){Location(4, 23, 4, 24)}]
            ){Location(4, 13, 4, 24)}
          , eos("\n  "{Location(4, 24, 5, 3)}){Location(4, 24, 5, 3)}
          ){Location(4, 6, 5, 3)}
        , EndDoStmt(no-label(){Location(5, 3, 5, 3)}, no-name(){Location(5, 9, 5, 9)}, eos("\n\n  "{Location(5, 9, 7, 3)}){Location(5, 9, 7, 3)}){Location(5, 3, 7, 3)}
        , PrintStmt(no-label(){Location(7, 3, 7, 3)}, STAR(){Location(7, 9, 7, 10)}, comma-list(["\"Fin\""{Location(7, 12, 7, 17)}]){Location(7, 10, 7, 17)}, eos("\n"{Location(7, 17, 8, 1)}){Location(7, 17, 8, 1)}){Location(7, 3, 8, 1)}
        ]
      ){Location(2, 3, 8, 1)}
    , no-subprogram-part(){Location(8, 1, 8, 1)}
    , EndProgramStmt(no-label(){Location(8, 1, 8, 1)}, "doconcurrent_0"{Location(8, 13, 8, 27)}, eos("\n"{Location(8, 27, 9, 1)}){Location(8, 27, 9, 1)}){Location(8, 1, 9, 1)}
    ){Location(1, 1, 9, 1)}
  ]
){Location(1, 1, 9, 1)}
