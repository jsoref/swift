// RUN: %target-swift-ide-test -print-module -module-to-print=DependentTypes -I %S/Inputs -source-filename=x -enable-experimental-cxx-interop | %FileCheck %s

// CHECK: func differentDependentArgAndRet<T, U>(_ a: Any, T: T.Type, U: U.Type) -> Any
// CHECK: func dependentReturnTypeInferred<T>(_ a: T) -> Any
// CHECK: func dependentReturnTypeSameAsArg<T>(_ a: Any, T: T.Type) -> Any
// CHECK: func multipleArgs<T>(_ a: Any, _ b: T, _ c: Int32) -> Any
// CHECK: func multipleDependentArgsInferred<T, U>(_ a: Any, _ b: Any, _ c: T, _ d: U) -> Any
// CHECK: func multipleDependentArgs<T, U>(_ a: Any, _ b: Any, T: T.Type, U: U.Type) -> Any
// CHECK: func refToDependent<T>(_ a: inout T) -> Any
// We don't support references to dependent types (rdar://89034440).
// CHECK-NOT: dependentRef
// CHECK-NOT: dependentRefAndRefInferred