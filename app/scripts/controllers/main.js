'use strict';

angular.module('jhuApp').controller('MainCtrl', function ($scope, $http, $state) {

    $http.get('classes.json').success(function(data){
        $scope.classes = data.classes;
    });

    $scope.selectClass = function(){
        $state.go('main.classWall', {class:_.str.slugify(this.class.classNum)});
    };

  });
