'use strict';

angular.module('kalabox.virtualbox', [])
  .factory('VirtualBox', ['$q', 'exec', function($q, exec) {

    var downloadPath = function() {

    };

    function getVersion() {
      var deferred = $q.defer();
      exec('VBoxManage -v', function(error, stdout) {
        if (error !== null) {
          deferred.resolve(false);
        }
        else {
          deferred.resolve(stdout);
        }
      });
      return deferred.promise;
    }

    return {
      downloadPath: downloadPath,
      getVersion: getVersion,
      version: '4.3.6'
    };

  }]);
