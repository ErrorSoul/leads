leads = angular.module('leads', ['ngAnimate'])

leads.config [
  '$httpProvider'
  
  
  
  ($httpProvider) ->
  
    authToken = $("meta[name=csrf-token]").attr("content")
    $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
    ]

leads.factory "Dater", [() ->
    days =  [1..31]
    create_months= ()->
      months = []
      month_arr = [1..12]
      month_names = ["январь", "февраль", "март",
                     "апрель", "май", "июнь",
                     "июль","август","сентябрь",
                     "октябрь","ноябрь","декабрь"]
      for num in [0..11]
        months.push({value:month_arr[num], month_name: month_names[num]})
      return months
    years= [1930..1996]

    create_utc_date = (date) ->
      birthDate = new Date(date.year, date.month, date.day)
      return '/Date(' + Date.UTC(birthDate.getFullYear(), birthDate.getMonth(), birthDate.getDate()).valueOf() + ')/'
    {
      days
      create_months
      years
      create_utc_date
    }
  
  ]
leads.controller("CreateUserCtrl", ['$scope','Dater','$http', ($scope, Dater, $http) ->



  #mod function

  
  `var mod = function (n, m) {
   var remain = n % m;
   return Math.floor(remain >= 0 ? remain : remain + m);
};`

 

  $scope.tab = 0
  $scope.getTab = (tab) ->
    return $scope.tab
  $scope.isTab = (tab) ->
    return $scope.tab is tab
  $scope.setTab = (tab) ->
    $scope.tab = tab
  $scope.addTab = (num) ->
    if num is 0
      $scope.tab = mod(($scope.tab + 1), 3)
    else
      $scope.tab = mod(($scope.tab - 1) ,  3)
  $scope.days = Dater.days
  $scope.months = Dater.create_months()
  $scope.years = Dater.years
  $scope.countries = [{name: "USA", code: "46"}]
  $scope.user = {}
  $scope.nums = [0..2]
  $scope.EMAIL_REGEXP =  /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/
  $scope.showMessage = ->
          $scope.messages isnt undefined and $scope.messages.length >0
  $scope.login = () ->
    $scope.user.birthdate = Dater.create_utc_date($scope.user.date)
    $http.post('/users', user: $scope.user).success((data) ->
      messageUpdater(data.message)
      console.log(data))
          .error((error) ->
            console.log(error, "ERROR")
            #add scope.message = "error #{error}"
            $scope.y = "Error #{error}" )
  reg_complete = (message, reg_complete) ->
    if message[0] is reg_complete[0]
      $scope.messages = ""
      $scope.user = {}
      $scope.tab = 3
    
  messageUpdater = (message) ->
    responses = {}
    email_been_taken = ["Email has already been taken"]
    registration_complete = ["registration complete"]
    responses[email_been_taken] = ["Такой пользователь уже есть"]
    responses[registration_complete] = ["Регистрация завершена"]
    $scope.messages = (if responses[message] then responses[message] else message)
    reg_complete(message, registration_complete)
    
    
    
    
      
] )
