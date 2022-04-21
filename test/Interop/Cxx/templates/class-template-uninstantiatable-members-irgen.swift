// RUN: %target-swift-emit-ir %s -I %S/Inputs -enable-experimental-cxx-interop | %FileCheck %s

import ClassTemplateInstantiationErrors

// CHECK-LABEL: define {{.*}}void @"$s4main23instantiateValidMembersyyF"()
// CHECK: call i32 @{{_ZN21CannotBeInstantiatedI10IntWrapperE8incValueEv|"\?incValue@\?\$CannotBeInstantiated@UIntWrapper@@@@QEAAHXZ"}}(%struct.CannotBeInstantiated*
// CHECK: call i32 @{{_ZN21CannotBeInstantiatedI10IntWrapperE8incValueES0_|"\?incValue@\?\$CannotBeInstantiated@UIntWrapper@@@@QEAAHUIntWrapper@@@Z"}}(%struct.CannotBeInstantiated*
// CHECK: ret void

// CHECK-LABEL: define {{.*}}i32 @{{_ZN21CannotBeInstantiatedI10IntWrapperE8incValueEv|"\?incValue@\?\$CannotBeInstantiated@UIntWrapper@@@@QEAAHXZ"}}(%struct.CannotBeInstantiated*
// CHECK: call i32 @{{_ZN21CannotBeInstantiatedI10IntWrapperE6getOneEv|"\?getOne@\?\$CannotBeInstantiated@UIntWrapper@@@@QEAAHXZ"}}(%struct.CannotBeInstantiated*
// CHECK: ret i32

// CHECK-LABEL: define {{.*}}i32 @{{_ZN21CannotBeInstantiatedI10IntWrapperE8incValueES0_|"\?incValue@\?\$CannotBeInstantiated@UIntWrapper@@@@QEAAHUIntWrapper@@@Z"}}(%struct.CannotBeInstantiated* {{.*}}, {{i32|i64|\[1 x i32\]|\%struct\.IntWrapper\* byval\(\%struct\.IntWrapper\)}}
// CHECK: call i32 @{{_ZN21CannotBeInstantiatedI10IntWrapperE6getOneEv|"\?getOne@\?\$CannotBeInstantiated@UIntWrapper@@@@QEAAHXZ"}}(%struct.CannotBeInstantiated*
// CHECK: ret i32

// CHECK-LABEL: define {{.*}}i32 @{{_ZN21CannotBeInstantiatedI10IntWrapperE6getOneEv|"\?getOne@\?\$CannotBeInstantiated@UIntWrapper@@@@QEAAHXZ"}}(%struct.CannotBeInstantiated*
// CHECK: ret i32 1
public func instantiateValidMembers() {
  var x = CannotBeInstantiated<IntWrapper>(IntWrapper(value: 41))
  x.incValue()
  var y = CannotBeInstantiated<IntWrapper>(IntWrapper(value: 0))
  y.incValue(IntWrapper(value: 41))
}
