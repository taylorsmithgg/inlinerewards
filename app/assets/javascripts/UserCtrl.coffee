class UserCtrl

  @headers = {'Accept': 'application/json', 'Content-Type': 'application/json'}
  @defaultConfig = {headers: @headers}

  constructor: (@$log, @UserService, @$modal, $scope, @$templateCache) ->
    @$log.debug "constructing UserController:"
    @users = []
    @$scope = $scope
    @getAllUsers()
    @$templateCache.put(
      'splash/index.html',
      '<section class="splash" ng-class="{\'splash-open\': animate}" ng-style="{\'z-index\': 1000, display: \'block\'}" ng-click="close($event)">' +
        '  <div class="splash-inner" ng-transclude></div>' +
        '</section>'
    )
    @$templateCache.put(
      'splash/content.html',
      '<img src="http://www.vincegolangco.com/wp-content/uploads/2010/12/batman-for-facebook.jpg"
             class="img-responsive thumbnail">
        <div class="splash-content text-center">
            <div class="row">
                <h1>{{ user.firstName }} {{ user.lastName }} <a ng-href="/users/profile/{{ user.id }}" ng-click="$close()"><i
                        class="fa fa-arrow-circle-right"></i></a></h1>
            </div>
            <h1>Points: {{ user.points }}</h1>

            <div class="row">
                <a class="btn btn-small btn-labeled btn-success btn-outline" href="/#">
                        <span class="btn-label">
                            <i class="fa fa-money"></i>
                        </span>Cash Out
                </a>
                <a class="btn btn-small btn-labeled btn-info btn-outline" href="mailto:{{ user.email }}">
                        <span class="btn-label">
                            <i class="fa fa-paper-plane"></i>
                        </span>Email
                </a>
                <a class="btn btn-small btn-labeled btn-warning btn-outline" ng-click="showAddPurchase = true">
                        <span class="btn-label">
                            <i class="fa fa-cart-plus"></i>
                        </span>Add Purchase
                </a>
            </div>
            <button class="btn btn-lg btn-outline" ng-bind="btnText || \'Close\'" ng-click="$close()"></button>
        </div>
        <div class="splash-content text-center container" style="background: black; border: solid black;"
             ng-show="showAddPurchase">
            <div class="row" ng-click="showAddPurchase = false"><i class="fa fa-times-circle-o fa-2x pull-right"></i></div>
            <div class="row" style="margin-top: 20%;">
                <form class="form-inline">
                    <div class="form-group">
                        <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>

                        <div class="input-group">
                            <div class="input-group-addon">$</div>
                            <input type="text" class="form-control" id="exampleInputAmount" placeholder="Amount">
                        </div>
                    </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <button type="submit" class="btn btn-primary">Add Purchase</button>
            </div>
                </form>
        </div>'
  )

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

  showModal: (userID)->
    console.log("User ID: " + userID)
    @UserService.getUser(userID)
    .then(
      (data) =>
        @$log.debug "Promise returned #{data} User"
        @$scope.user = data
    ,
      (error) =>
        @$log.error "Unable to retrieve User: #{error}"
    )
    @myOtherModal = @$modal.open(
      templateUrl: 'splash/content.html'
      windowTemplateUrl: 'splash/index.html'
      backdrop: false
      scope: @$scope
      size: 'sm'
    )

controllersModule.controller('UserCtrl', UserCtrl)