dependencies = [
  'ngRoute',
  'myApp.filters',
  'myApp.services',
  'myApp.controllers',
  'myApp.directives',
  'myApp.common',
  'myApp.routeConfig'
]

app = angular.module('myApp', dependencies)

angular.module('myApp.routeConfig', ['ngRoute'])
.config ($routeProvider) ->
  $routeProvider
  .when('/', {
      templateUrl: '/assets/partials/view.html'
    })
  .when('/users/create', {
      templateUrl: '/assets/partials/create.html'
    })
  .when('/users/edit/:id', {
      templateUrl: '/assets/partials/update.html'
    })
  .when('/users/profile/:id', {
      templateUrl: '/assets/partials/profile.html'
    })
  .when('/users/edit', {
      templateUrl: '/assets/partials/users.html'
    })
  .when('/admin', {
      templateUrl: '/assets/partials/admin.html'
    })
  .otherwise({redirectTo: '/'})
.config ($locationProvider) ->
  $locationProvider.html5Mode({
    enabled: true,
    requireBase: false
  })

@commonModule = angular.module('myApp.common', [])
@controllersModule = angular.module('myApp.controllers', [])
@servicesModule = angular.module('myApp.services', [])
@modelsModule = angular.module('myApp.models', [])
@directivesModule = angular.module('myApp.directives', [])
@filtersModule = angular.module('myApp.filters', [])