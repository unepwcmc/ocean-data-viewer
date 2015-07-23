var module = angular.module("MarineApp", [
  'directives.map',
  'directives.multiSelector',
  'directives.clickAnywhereButHere',
  'resources.mapSearch'
]);

module.controller('SearchCtrl',
    ['$scope', 'MapSearch',
    function($scope, MapSearch) {

  $scope.showingOptions = false;
  $scope.showingAdvanced = false;
  $scope.showingSearchResults = false;

  // page load initial search
  MapSearch.query({sort_by: 'creation_date DESC'}).then(function(result) {
    console.log(result)

    $scope.$broadcast('searchResults', result);
  });

  $scope.sortByOptions = [
    {text: 'Publication date', value: 'creation_date DESC'},
    {text: 'Title', value: 'title'}
  ];

  $scope.defaultFilters = {
    sort_by: $scope.sortByOptions[0],
    data_categories: {},
    formats: {},
    observation_types: {},
    geographical_ranges: {}
  };

  $scope.filters = angular.copy($scope.defaultFilters, {});

  $scope.select = function(option) {
    $scope.filters.sort_by = option;
  };

  $scope.toggleOptions = function() {
    $scope.showingOptions = !$scope.showingOptions;
  };

  $scope.doSearch = function (options) {
    var queryOptions = {sort_by: $scope.filters.sort_by.value},
        addToQuery = function (attributeName) {
          var values = selectedValues($scope.filters[attributeName]);
          if (values.length > 0) {
            queryOptions[attributeName + '[]'] = values;
          }
        };

    queryOptions["text_search"] = $scope.filters["text_search"]
    addToQuery('data_categories');
    addToQuery('formats');
    addToQuery('observation_types');
    addToQuery('geographical_ranges');

    MapSearch.query(queryOptions).then(function(result) {
      $scope.$emit('resetMap');
      $scope.$broadcast('searchResults', result);

      if (options) {
        $scope.showingSearchResults = options.isUserSearch;
      }
    });
  };

  $scope.reset = function() {
    $scope.filters = angular.copy($scope.defaultFilters, {});
    $scope.$emit('resetMap');
    $scope.doSearch({isUserSearch: false});
    $scope.showingAdvanced = false;
    $scope.showingSearchResults = false;
  };

  $scope.shouldShowResetButton = function() {
    return !$scope.showingFilters && !angular.equals($scope.filters, $scope.defaultFilters);
  };

  $scope.closeFilters = function() {
    $scope.showingFilters = false;
  };
}]);

module.controller('DatasetsListingCtrl',
    ['$scope',
    function($scope) {

  $scope.layers = [];

  $scope.label = function() {
    if ($scope.layers.length == 1)
      return 'dataset'
    else
      return 'datasets'
  }

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
    layer.showingMore = !layer.showingMore;
  };

}]);

module.controller('ShowDatasetCtrl',
    ['$scope', 'MapSearch',
    function($scope, MapSearch) {

  $scope.showDataset = function(dataset_id) {
    MapSearch.get(dataset_id).then(function(result) {
      $scope.$emit('layerLoaded', result.title, result);
      $scope.$emit('toggleLayer', result.title);
    });
  };

}]);
