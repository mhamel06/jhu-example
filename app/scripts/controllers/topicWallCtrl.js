'use strict';

angular.module('jhuApp').controller('topicWallCtrl', function($scope, $http, $stateParams){
    $scope.topic = {};
    $scope.class = $stateParams.class;
    $scope.params = {
        class:$stateParams.class,
        topic:$stateParams.topic
    };

    $scope.submitReply = function(){
        var reply = {
            topicId: $stateParams.topic,
            content: this.reply.content,
            class:$scope.class
        };

        if(!$scope.topic.replies) $scope.topic.replies = [];


        $http.post('/topics/reply', reply).success(function(respObj){
            $scope.topic.replies.push(respObj);
            $scope.reply = {};
        });
    };


    $http.get('/topics/' + $stateParams.topic).success(function(doc){
        $scope.topic = doc;    
    });



});
