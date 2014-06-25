var module = angular.module("MarineApp", ['directives.map', 'resources.mapSearch']);

module.controller('SearchCtrl', ['$scope', 'MapSearch', function($scope, MapSearch) {
  console.log( MapSearch.query({sort_by: 'creation_date'}) );
}]);
