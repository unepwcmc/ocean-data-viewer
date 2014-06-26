var module = angular.module("MarineApp", ['directives.map', 'resources.mapSearch']);

module.controller('SearchCtrl', ['$scope', 'MapSearch', function($scope, MapSearch) {

  MapSearch.query({sort_by: 'creation_date'}).then(function(result) {
    $scope.$broadcast('searchResults', result);
  });

}]);

module.controller('DatasetsListingCtrl', ['$scope', function($scope) {
  $scope.layers = [];

  $scope.$on('searchResults', function(event, datasets) {
    $scope.layers = datasets;
  });

  $scope.$watch('layers', function(layers) {
    for (var i=0; i < $scope.layers.length ; ++i) {
      var layer = $scope.layers[i];
      $scope.$emit('layerLoaded', layer.title, layer);
    }
  });

  $scope.toggleLayerVisibility = function(layer) {
    $scope.$emit('toggleLayer', layer.title);
    layer.visible = !layer.visible;
  };

  $scope.toggleMoreInfo = function(layer) {
    layer.showingMore = !layer.showingMore;
  };
}]);
