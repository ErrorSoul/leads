admin = angular.module('leads', [])

admin.controller("CreateUserCtrl", ['$scope', ($scope) ->
  $scope.x = 'ffff'
  $scope.days = [1..31]
  $scope.months = [1..12]
  $scope.years = [1930..1996]
  console.log($scope.sels, "FFF")
] )
