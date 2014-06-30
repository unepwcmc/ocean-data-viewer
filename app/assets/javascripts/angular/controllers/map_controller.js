var module = angular.module("MarineApp", ['directives.map', 'directives.multiSelector', 'resources.mapSearch']);

module.controller('SearchCtrl', ['$scope', 'MapSearch', function($scope, MapSearch) {

  $scope.showingOptions = false;
  $scope.showingAdvanced = false;

  // page load initial search
  MapSearch.query({sort_by: 'creation_date'}).then(function(result) {
    $scope.$broadcast('searchResults', result);
  });

  $scope.sortByOptions = [
    {text: 'Creation date', value: 'creation_date'},
    {text: 'Title', value: 'title'}
  ];

  $scope.filters = {
    sort_by: $scope.sortByOptions[0],
    data_categories: {},
    formats: {},
    observation_types: {},
    geographical_ranges: {}
  };

  $scope.select = function(option) {
    $scope.filters.sort_by = option;
  };

  $scope.doSearch = function () {
    var queryOptions = {sort_by: $scope.filters.sort_by.value},
        addToQuery = function (attributeName) {
          var values = selectedValues($scope.filters[attributeName]);
          if (values.length > 0) {
            queryOptions[attributeName + '[]'] = values;
          }
        };

    addToQuery('data_categories');
    addToQuery('formats');
    addToQuery('observation_types');
    addToQuery('geographical_ranges');

    MapSearch.query(queryOptions).then(function(result) {
      $scope.$broadcast('searchResults', result);
    });
  };

  $scope.reset = function() {
    $scope.filters = {
      sort_by: $scope.sortByOptions[0],
      data_categories: {},
      formats: {},
      observation_types: {},
      geographical_ranges: {}
    };
    $scope.$emit('resetMap');
    $scope.doSearch();
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
