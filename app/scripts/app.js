'use strict';

angular.module('jhuApp', ['ngAnimate', 'ui.router', 'btford.markdown']).config(function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise("/");
  //
  // Now set up the states
  $stateProvider
    .state('main', {
        templateUrl:'views/main.html',
        controller: 'MainCtrl'
    })
    .state('main.classList', {
      url: "/",
      templateUrl: "views/classList.html",
      controller: 'ClassListCtrl'
  })
  .state('main.classWall', {
      url: '/classWall/:class',
      templateUrl: 'views/classWall.html',
      controller: 'classWallCtrl'
  }).state('main.topicWall', {
      url: '/classWall/:class/:topic',
      templateUrl: 'views/topicWall.html',
      controller: 'topicWallCtrl'
  });
});
