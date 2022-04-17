// RUN: not %target-swift-emit-ir %s -I %S/Inputs -enable-experimental-cxx-interop 2>&1 | %FileCheck %s

import ClassTemplateInstantiationErrors

// CHECK: error: no member named 'doesNotExist' in 'IntWrapper'
// CHECK: note: in instantiation of member function 'CannotBeInstantiated<IntWrapper>::memberWrongType' requested here
public func test() {
  var x = CannotBeInstantiated<IntWrapper>(CChar(0), CChar(0))
  x.incValue() // This is just to make sure "x" isn't removed.
}
