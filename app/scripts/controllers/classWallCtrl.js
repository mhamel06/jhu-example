'use strict';

angular.module('jhuApp').controller('classWallCtrl', function($scope, $http, $stateParams, $state){
    $scope.topics = [];
    $scope.class = $stateParams.class;

    $scope.postTopic = function(){
        var topic = {
            title: this.topicTitle,
            content: this.markdown,
            class:$scope.class
        };
        $scope.topics.push(topic);
        $http.post('/topics/', topic)
    }

    $scope.selectTopic = function(){
        $state.go('main.topicWall', {class:$scope.class, topic: this.post._id});
    };

    $http.get('/topics/').success(function(docs){
        $scope.topics = docs;
    });

});
