class UserCtrl

    @headers = {'Accept': 'application/json', 'Content-Type': 'application/json'}
    @defaultConfig = {headers: @headers}

    constructor: (@$log, @UserService, @$modal) ->
      @$log.debug "constructing UserController:"
      @users = []
      @user = {}
      # Pre-fetch an external template populated with a custom scope
      @myOtherModal = @$modal(
#        template: '/assets/partials/profile.html'
        contentTemplate: '/assets/partials/profile.html'
        show: false
        persist: false
      )
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
        ,
          (error) =>
            @$log.error "Unable to create User: #{error}"
    )

    # Show when some event occurs (use $promise property to ensure the template has been loaded)
    showModal: (index)->
      @myOtherModal.$scope.user = @users[index]
      @myOtherModal.$promise.then @myOtherModal.show
      return

controllersModule.controller('UserCtrl', UserCtrl)