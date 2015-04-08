import Foo from 'dir/foo';
import * as foo2 from 'dir/foo2';

(() => {
  var foo = new Foo('bar');
  foo.foo();

  document.write('<p>' + foo2.foo1 + '</p>');
  document.write('<p>' + foo2.foo2 + '</p>');
})();
