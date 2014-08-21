leads = angular.module('leads', [])

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
  $scope.days = Dater.days
  $scope.months = Dater.create_months()
  $scope.years = Dater.years
  $scope.countries = [{name: "USA", code: "46"}]
  $scope.user = {}
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
            $scope.y = "Error #{error}" )

  messageUpdater = (message) ->
    responses = {}
    email_been_taken = ["Email has already been taken"]
    registration_complete = ["registration complete"]
    responses[email_been_taken] = ["Такой пользователь уже есть"]
    responses[registration_complete] = ["Регистрация завершена"]
    $scope.messages = (if responses[message] then responses[message] else message)
    
    
      
] )
