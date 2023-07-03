#! @Chapter Precompilation

#! @Section Precompiling the category of ZX-diagrams

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "ZXCalculusForCAP", false );
#! true

ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "ZXCalculusForCAP", "gap/CompilerLogic.gi" );
#! true

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

CategoryOfZXDiagrams_precompiled( );
#! Category of ZX-diagrams

cat := CategoryOfZXDiagrams( );
#! Category of ZX-diagrams

cat!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample
