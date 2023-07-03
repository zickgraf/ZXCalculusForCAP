# @Chapter Examples and tests

# @Section Examples

# @Example

LoadPackage( "ZXCalculusForCAP", false );
# true

ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
# true

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
# true

ReadPackageOnce( "FunctorCategories", "gap/CompilerLogic.gi" );
# true

#ReadPackage( "ZXCalculusForCAP", "gap/CompilerLogic.gi" );
# true

CapJitAddTypeSignature( "CoproductFunctorial", [ IsCapCategory, IsList ], function ( input_types )
  local category;
    
    category := input_types[1].category;
    
    Assert( 0, IsSpecializationOfFilter( MorphismFilter( category ), input_types[2].element_type.filter ) );
    
    return CapJitDataTypeOfMorphismOfCategory( category );
    
end );

CapJitAddTypeSignature( "CAP_JIT_INCOMPLETE_LOGIC", [ IsObject ], function ( input_types )
    
    return input_types[1];
    
end );

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "value" ],
        src_template := "CAP_JIT_INCOMPLETE_LOGIC( value )",
        dst_template := "value",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "ZX_IntegerToLabel( BigInt( 0 ) )",
        dst_template := "\"neutral\"",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "label" ],
        src_template := "ZX_IntegerToLabel( ZX_LabelToInteger( label ) )",
        dst_template := "label",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "func" ],
        src_template := "ForAll( [ ], func )",
        dst_template := "true",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "s", "D" ],
        src_template := "SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D )",
        dst_template := "SKELETAL_FIN_SETS_ExplicitCoequalizer_primitive_input( Length( s ), List( D, x -> Triple( Length( Source( x ) ), AsList( x ), Length( Range( x ) ) ) ) )",
        new_funcs := [ [ "x" ] ],
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry" ],
        src_template := "ListWithIdenticalEntries( 2, entry )",
        dst_template := "[ entry, entry ]",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "from", "to", "x" ],
        src_template := "[ from .. to ][1 + x]",
        dst_template := "from + x",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "value", "to" ],
        src_template := "List( [ 0 .. to ], i -> value + i )",
        dst_template := "[ value .. value + to ]",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "value1", "value2", "to" ],
        src_template := "List( [ 0 .. to ], i -> value1 + (value2 + i) )",
        dst_template := "[ value1 + value2 .. value1 + value2 + to ]",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "from", "via", "to" ],
        src_template := "Concatenation( [ from .. via - 1 ], [ via .. to ] )",
        dst_template := "[ from .. to ]",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "from", "via1", "via2", "to" ],
        src_template := "Concatenation( [ from .. via1 + (via2 - 1) ], [ via1 + via2 .. to ] )",
        dst_template := "[ from .. to ]",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "functor_source", "functor_range", "object_datum", "cat2", "source", "range", "attr", "morphism_datum" ],
        src_template := "CreateCapCategoryObjectWithAttributes( cat, Source, functor_source, Range, functor_range, ValuesOfPreSheaf, object_datum )( CreateCapCategoryMorphismWithAttributes( cat2, source, range, attr, morphism_datum ) )",
        dst_template := "ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( cat, CreateCapCategoryObjectWithAttributes( cat, Source, source, Range, range, ValuesOfPreSheaf, object_datum ), CreateCapCategoryMorphismWithAttributes( cat2, source, range, attr, morphism_datum ) )",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "source", "range", "morphism_datum", "obj" ],
        src_template := "CreateCapCategoryMorphismWithAttributes( cat, source, range, ValuesOnAllObjects, morphism_datum )( obj )",
        dst_template := "ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( cat, CreateCapCategoryMorphismWithAttributes( cat, source, range, ValuesOnAllObjects, morphism_datum ), obj )",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry1", "entry2" ],
        src_template := "SafePosition( [ entry1, entry2 ], entry1 )",
        dst_template := "1",
    )
);

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry1", "entry2" ],
        src_template := "SafePosition( [ entry1, entry2 ], entry2 )",
        dst_template := "2",
    )
);

category_constructor := { } -> CategoryOfZXDiagrams( );;
given_arguments := [ ];;
compiled_category_name := "CategoryOfZXDiagrams_precompiled";;
package_name := "ZXCalculusForCAP";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name :
    operations := "primitive",
    number_of_objectified_objects_in_data_structure_of_object := 1,
    number_of_objectified_morphisms_in_data_structure_of_object := 0,
    number_of_objectified_objects_in_data_structure_of_morphism := 2,
    number_of_objectified_morphisms_in_data_structure_of_morphism := 1
);;

# @EndExample
