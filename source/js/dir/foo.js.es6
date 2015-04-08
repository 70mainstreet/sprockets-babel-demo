export default class Foo {

  constructor(foo) {
    this._foo = foo;
  }

  foo() {
    document.write('<p>' + this._foo + '</p>');
  }

}