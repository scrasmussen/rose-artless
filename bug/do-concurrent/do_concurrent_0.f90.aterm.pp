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
          , [ EntityDecl("i"{Location(2, 14, 2, 15)}, no-list(){Location(2, 15, 2, 15)}, no-list(){Location(2, 15, 2, 15)}, no-char-length(){Location(2, 15, 2, 15)}, no-init(){Location(2, 15, 2, 15)}){Location(2, 14, 2, 15)}
            , EntityDecl("a"{Location(2, 17, 2, 18)}, no-list(){Location(2, 18, 2, 18)}, no-list(){Location(2, 18, 2, 18)}, no-char-length(){Location(2, 18, 2, 18)}, no-init(){Location(2, 18, 2, 18)}){Location(2, 17, 2, 18)}
            ]
          , eos("\n  "{Location(2, 18, 3, 3)}){Location(2, 18, 3, 3)}
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
        , AssignmentStmt(
            no-label(){Location(4, 6, 4, 6)}
          , DataRef([PartRef("a"{Location(4, 6, 4, 7)}, no-section-subscripts(){Location(4, 8, 4, 8)}, no-image-selector(){Location(4, 8, 4, 8)}){Location(4, 6, 4, 8)}]){Location(4, 6, 4, 8)}
          , UnaryMinus(IntVal("1"{Location(4, 11, 4, 12)}){Location(4, 11, 4, 12)}){Location(4, 10, 4, 12)}
          , eos("\n  "{Location(4, 12, 5, 3)}){Location(4, 12, 5, 3)}
          ){Location(4, 6, 5, 3)}
        , EndDoStmt(no-label(){Location(5, 3, 5, 3)}, no-name(){Location(5, 9, 5, 9)}, eos("\n"{Location(5, 9, 6, 1)}){Location(5, 9, 6, 1)}){Location(5, 3, 6, 1)}
        ]
      ){Location(2, 3, 6, 1)}
    , no-subprogram-part(){Location(6, 1, 6, 1)}
    , EndProgramStmt(no-label(){Location(6, 1, 6, 1)}, "doconcurrent_0"{Location(6, 13, 6, 27)}, eos("\n"{Location(6, 27, 7, 1)}){Location(6, 27, 7, 1)}){Location(6, 1, 7, 1)}
    ){Location(1, 1, 7, 1)}
  ]
){Location(1, 1, 7, 1)}
