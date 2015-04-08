import Foo from 'dir/foo';
import Foo3 from 'dir/dir2/foo3';
import * as foo2 from 'dir/foo2';

(() => {
  var foo = new Foo('bar');
  foo.foo();

  document.write('<p>' + foo2.foo1 + '</p>');
  document.write('<p>' + foo2.foo2 + '</p>');

  var foo3 = new Foo3('');
  foo3.foo();
})();
