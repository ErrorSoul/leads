describe "CreateUserCtrl", ->
  describe "create user", ->
    beforeEach module('leads')
    beforeEach(inject(($injector, _$httpBackend_, $rootScope, $controller) ->
      @httpBackend = _$httpBackend_
      @scope = $rootScope.$new()
      @service = $injector.get('Dater')
      @ctrl = $controller('CreateUserCtrl', $scope: @scope)
      @user =
             first_name: "Batman"
             last_name: "Semenovich"
             country:  '46'
             email: 'call_robin@mail.ru'
             birthdate: 'Date 1'
             password: 'jokers'
             date: {day: '1', month: '4', year: "1985"}
      ))
    afterEach ->
      @service = undefined
      @httpBackend.verifyNoOutstandingExpectation()
      @httpBackend.verifyNoOutstandingRequest()
    describe 'create user', ->
      it 'should return complete', ->
        @httpBackend.expectPOST('/users', user: @user).respond({message: "registration complete" })
        @scope.user = @user
        @scope.login()
        @httpBackend.flush()
        expect(@scope.messages).toEqual(["Регистрация завершена"])
  
             
