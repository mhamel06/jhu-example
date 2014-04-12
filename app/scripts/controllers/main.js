'use strict';

angular.module('jhuApp')
  .controller('MainCtrl', function ($scope, $http, $animate) {
    $http.get('classes.json').success(function(data){
        $scope.classes = data.classes;
    });
  });
