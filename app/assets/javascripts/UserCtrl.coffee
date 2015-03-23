class UserCtrl

    @headers = {'Accept': 'application/json', 'Content-Type': 'application/json'}
    @defaultConfig = {headers: @headers}

    constructor: (@$log, @UserService) ->
      @$log.debug "constructing UserController for scope:"
      @users = []
      @user
      @getAllUsers()

    getAllUsers: () ->
      @$log.debug "getAllUsers()"

      @UserService.listUsers()
      .then(
        (data) =>
          @$log.debug "Promise returned #{data.length} Users"
          @users = data
      ,
        (error) =>
          @$log.error "Unable to get Users: #{error}"
      )

    deleteUser: (user) ->
      @$log.debug "deleteUser()"
      @UserService.deleteUser(user)
      .then(
        (data) =>
          @users.splice(@users.indexOf(user), 1)
          @$log.debug "Promise returned #{data} User"
          @user = data
      ,
        (error) =>
          @$log.error "Unable to delete User: #{error}"
      )

    createUser: () ->
        @$log.debug "createUser()"
        @user.active = true
        @UserService.createUser(@user)
        .then(
          (data) =>
            @$log.debug "Promise returned #{data} User"
            @user = data
            @$location.path("/")
        ,
          (error) =>
            @$log.error "Unable to create User: #{error}"
      )

controllersModule.controller('UserCtrl', UserCtrl)