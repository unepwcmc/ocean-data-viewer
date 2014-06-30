var module = angular.module('directives.multiSelector', []);

module.directive('multiSelector', ['$compile', '$rootScope', function($compile, $rootScope) {
  return {
    restrict: 'E',
    template: '<div class="multi-selector-widget">\
               <div class="filter-select">\
                  <a ng-click="visible=!visible">\
                  <span ng-bind="titleLabel"></span>\
                  <i class="icon-angle-down"></i></a>\
               </div>\
                   <div ng-show="visible" class="content" ng-transclude></div>\
               </div>',
    replace: false,
    transclude: true,
    scope: {
      bind: '=',
      model: '='
    },
    link: function($scope, $element) {
      $scope.visible = false;
      $scope.$watchCollection('model', function(newValue) {
          var selected = selectedValues(newValue);
          if (selected.length == 1) {
              $scope.titleLabel = "1 category";
          } else if (selected.length > 1) {
              $scope.titleLabel = selected.length + " categories";
          } else {
              $scope.titleLabel = "Any";
          };
      });
    }
  };
}]);

module.directive('checkOption', ['$compile', '$rootScope', function($compile, $rootScope) {
  return {
    restrict: 'E',
      template: '<div class="check-option">\
          <input id="{{value}}-id" type="checkbox" name="{{name}}" value="{{value}}" ng-model="model" />\
          <label for="{{value}}-id" ng-transclude></label></div>',
    replace: true,
    transclude: true,
    scope: {
      model: '=',
      value: '@'
    }
  };
}]);
