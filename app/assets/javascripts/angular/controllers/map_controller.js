var module = angular.module("MarineApp", ['directives.map', 'resources.mapSearch']);

// needs transform the :key's to an array keeping only then ones which the :value is true
function selectedValues(obj) {
  var keysWithTrueValue = [];
  for (var key in obj) {
    if (obj[key]) {
      keysWithTrueValue.push(key);
    }
  }
  return keysWithTrueValue;
}

module.controller('SearchCtrl', ['$scope', 'MapSearch', function($scope, MapSearch) {

  MapSearch.query({sort_by: 'creation_date'}).then(function(result) {
    $scope.$broadcast('searchResults', result);
  });

  $scope.sortByOptions = [
    {text: 'Creation date', value: 'creation_date'},
    {text: 'Title', value: 'title'}
  ];

  $scope.filters = {
    sort_by: 'creation_date',
    data_categories: {},
    formats: {},
    observation_types: {},
    geographical_ranges: {}
  };

  // filters.data_categories = {1: true, 2: false}

  $scope.doSearch = function () {
    var queryOptions = {sort_by: $scope.filters.sort_by},
        addToQuery = function (attributeName) {
          var values = selectedValues($scope.filters[attributeName]);
          if (values.length > 0) {
            queryOptions[attributeName] = values;
          }
        };

    addToQuery('data_categories');
    addToQuery('formats');
    addToQuery('observation_types');
    addToQuery('geographical_ranges');

    console.log(queryOptions);

    MapSearch.query(queryOptions).then(function(result) {
      $scope.$broadcast('searchResults', result);
    });
  };

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
