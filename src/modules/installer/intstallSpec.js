/* global  describe, it, expect*/

'use strict';

describe('Controller: MainCtrl', function () {

  // load the controller's module
  beforeEach(module('kalabox.installer'));

  var InstallerCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    InstallerCtrl = $controller('InstallerCtrl', {
      $scope: scope
    });
  }));

  it('exists on the app', function () {
    expect(InstallerCtrl).toBeDefined();
  });
});
