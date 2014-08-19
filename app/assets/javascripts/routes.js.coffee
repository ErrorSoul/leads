admin = angular.module('leads', [])

admin.controller("CreateUserCtrl", ['$scope', ($scope) ->
  $scope.x = 'ffff'
  $scope.days = [1..31]
  $scope.create_months =()->
    months = []
    month_arr = [1..12]
    month_names = ["январь", "февраль", "март", "апрель", "май", "июнь", "июль","август","сентябрь","октябрь","ноябрь","декабрь"]
    for num in [0..11]
      months.push({value:month_arr[num], month_name: month_names[num]})
    return months
  $scope.months = $scope.create_months()
  $scope.years = [1930..1996]
  $scope.countries = [{name: "USA", code: "46"}]
  $scope.user = {}
  #$scope.user.lastname = "Smirnoff"
  $scope.EMAIL_REGEXP =  /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/

  $scope.login = () ->
    console.log("SUBMIT")
  
] )
