dependencies = [
  'ngRoute',
  'ngResource',
  'ui.bootstrap',
  'app.filters',
  'app.services',
  'app.controllers',
  'app.directives',
  'app.common',
  'app.routeConfig'
]

app = angular.module('app', dependencies)
  .config ($routeProvider) ->
    $routeProvider
      .when('/', {
          templateUrl: '/assets/partials/view.html'
        })
      .when('/users/create', {
          templateUrl: '/assets/partials/create.html'
        })
      .when('/users/edit/:firstName/:lastName', {
          templateUrl: '/assets/partials/update.html'
        })
      .otherwise({redirectTo: '/'})

  .config ($locationProvider) ->
    $locationProvider.html5Mode({
      enabled: true,
      requireBase: false
    })

  .factory('Person', [
    '$resource'
    ($resource) ->
      $resource 'persons/:id', {'id': '@id'}, {
        'save':
          method: 'POST'
      }, 'query':
        method: 'GET'
  ])

  .controller('PersonCtrl', [
    '$scope'
    'Person'
    ($scope, Person) ->
      $scope.createForm = {}
      $scope.persons = Person.query(q: '{}')

      $scope.create = ->
        person = new Person(
          name: $scope.createForm.name
          age: $scope.createForm.age)

      person.$save ->
        $scope.createForm = {}
        $scope.persons = Person.query()

      $scope.remove = (person) ->
        person.$remove ->
        $scope.persons = Person.query()

      $scope.update = (person) ->
        person.$save ->
        $scope.persons = Person.query()
  ])

@commonModule = angular.module('app.common', [])
@controllersModule = angular.module('app.controllers', [])
@servicesModule = angular.module('app.services', [])
@modelsModule = angular.module('app.models', [])
@directivesModule = angular.module('app.directives', [])
@filtersModule = angular.module('app.filters', [])
