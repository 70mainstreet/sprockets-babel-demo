import Foo from '../foo';

export default class Foo3 extends Foo {

  constructor(foo) {
    super(foo);
  }

  foo() {
    document.write('<p>baaahh</p>');
  }

}