var module = angular.module('directives.map', []);

module.directive('map', [function() {
  return {
    restrict: 'E',
    template: '<div class="map-directive"><div class="js_map"></div>\
            <div class="zoom_buttons">\
                <a class="zoomIn" ng-click="zoomIn()"></a>\
                <a class="zoomOut" ng-click="zoomOut()"></a>\
            </div></div>',
    replace: true,
    scope: {
      baseLayer: '@'
    },
    link: function($scope, $element) {
      $scope.map = new Map($element.find('.js_map').get(0), $scope.baseLayer);

      $scope.zoomIn = function() {
        $scope.map.zoomIn();
      }
      $scope.zoomOut = function() {
        $scope.map.zoomOut();
      }

      $scope.map.plot();
    }
  };
}]);
