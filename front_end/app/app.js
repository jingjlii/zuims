'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
        'ui.router',
        'myApp.version',
        'myApp.register',
        'myApp.about',
        'myApp.login',
        'myApp.home',
        'myApp.userinfo',
<<<<<<< HEAD
<<<<<<< HEAD
        'myApp.dinninglist',
        'myApp.myinfo'
=======
        'myApp.dinninglist'
>>>>>>> ff724717408678ba1723a192d16d92c781d90b26
=======
        'myApp.dinninglist',
        'myApp.myinfo'
>>>>>>> 2a0f553375518588bd21b281467767962644662f
    ])
    .config(['$urlRouterProvider', function ($urlRouterProvider) {
        $urlRouterProvider.otherwise('/about');
    }])
    .controller('TabCtrl', function ($scope, $location) {
        $scope.goHome = function () {
            $location.path('/home');
        };
        $scope.goUserInfo = function () {
            $location.path('/about');
        };
    });
