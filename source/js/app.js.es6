//= require_directory './zoo'
//= require_directory './zoo/canis'

import Animal from 'zoo/Animal';
import * as C from 'zoo/Cat';
import Dog from 'zoo/canis/Dog';

(() => {
  var animal = new Animal('generic animal');
  animal.talk();

  var dog = new Dog('Fido');
  dog.talk();

  var cat = new C.Cat(C.catName1);
  cat.talk();
})();