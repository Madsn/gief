'use strict'

angular.module 'giefApp'
.controller 'MainCtrl', ($scope, $http, socket) ->
  $scope.awesomeThings = []

  $http.get('/api/things').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings
    socket.syncUpdates 'thing', $scope.awesomeThings

  $scope.addThing = ->
    return if $scope.newThing is ''
    $http.post '/api/things',
      name: $scope.newThing

    $scope.newThing = ''

  $scope.deleteThing = (thing) ->
    $http.delete '/api/things/' + thing._id

  $scope.updateThing = (thing) ->
    $http.put '/api/things/' + thing._id,
      name: thing.name
      price: thing.price
      added: thing.added
      url: thing.url
      img: thing.img


  $scope.$on '$destroy', ->
    socket.unsyncUpdates 'thing'
