angular.module('resources.mapSearch', ['rails'])
  .factory('MapSearch', ['railsResourceFactory', function($railsResourceFactory) {
    return $railsResourceFactory({
      url: '/map_search',
      name: 'search'
    });
}]);
