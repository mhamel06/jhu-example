'use strict';

angular.module('jhuApp').controller('ClassListCtrl', function ($scope, $http, $state) {
    $scope.topics = [];
    $scope.topicsMap = {};

    $http.get('classes.json').success(function(data){
        $scope.classes = data.classes;
    });

    $scope.selectClass = function(){
        $state.go('main.classWall', {class:_.str.slugify(this.class.classNum)});
    };

    $scope.getTopics = function(curClass){
        var className = _.str.slugify(curClass.classNum);
        if($scope.topicsMap[className]){

            curClass.length = $scope.topicsMap[className].length;
            return curClass.length;
        }
        curClass.length = 0;
        return curClass.length;
    }

    $http.get('/topics/').success(function(docs){
        $scope.topics = docs;
        angular.forEach(docs, function(value, key){

            if(!$scope.topicsMap[value.class]) $scope.topicsMap[value.class] = [];

            $scope.topicsMap[value.class].push(value);

        });
    });

  });
