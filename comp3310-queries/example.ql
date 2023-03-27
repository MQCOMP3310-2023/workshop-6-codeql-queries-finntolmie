/**
 * @name Comp3310 workshop 6 query
 * @kind problem
 * @problem.severity warning
 * @id java/example/empty-block
 */

import java

from MethodAccess call, Method method, LoopStmt loop
where
  loop.getAChild*() = call.getEnclosingStmt() and
  call.getMethod() = method and
  method.hasName("println") and
  method.getDeclaringType().hasQualifiedName("java.io", "PrintStream") and
  not exists(MethodAccess call2 |
    loop.getAChild*() = call2.getEnclosingStmt() and
    call2.getMethod().hasName("nextLine") and
    call2.getMethod().getDeclaringType().hasQualifiedName("java.util", "Scanner")
  )
select call, method, "This is a println method in the same loop as a scanner."
