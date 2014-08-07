var module = angular.module('directives.multiSelector', []);

module.directive('multiSelector', ['$compile', '$rootScope', function($compile, $rootScope) {
  return {
    restrict: 'E',
    template: '<div class="multi-selector-widget">\
                 <div ng-click="visible=!visible" ng-class="[\'filter-select\', selected.length >=1 && \'active\' ]">\
                    <span class="title-label" ng-bind="titleLabel"></span>\
                    <i ng-class="visible ? \'icon-angle-up\' : \'icon-angle-down\'"></i>\
                 </div>\
                  <div ng-class="[\'options\', visible && \'visible\']">\
                    <div class="options-container" ng-transclude></div>\
                  </div>\
               </div>',
    replace: false,
    transclude: true,
    scope: {
      bind: '=',
      model: '=',
      name: '@'
    },
    link: function($scope, $element) {
      $scope.selected = [];
      $scope.visible = false;
      var numberMaxOfCharecters = 26;

      var getName = function(categoryKey) {
        return $element.find('label[for="' + $scope.name + '-' + categoryKey + '-id"] .label-text').text();
      };

      $scope.$watchCollection('model', function(newValue) {
        $scope.selected = selectedValues(newValue);

        if ($scope.selected.length == 1) {
          $scope.titleLabel = "1 category";

          // use the name in case it's less than 26 characters
          var categoryName = getName($scope.selected[0]);
          if (categoryName.length <= numberMaxOfCharecters) {
            $scope.titleLabel = categoryName;
          }
        } else if ($scope.selected.length > 1) {
          var categoriesNames = [];
          $scope.titleLabel = $scope.selected.length + " categories";

          for (var i=0;i<$scope.selected.length;i++) {
            categoriesNames.push(getName($scope.selected[i]));
          }
          categoriesNames = categoriesNames.join(', ');

          if (categoriesNames.length <= numberMaxOfCharecters) {
            $scope.titleLabel = categoriesNames;
          }
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
          <input id="{{name}}-{{value}}-id" type="checkbox" name="{{name}}" value="{{value}}" ng-model="model" />\
          <label for="{{name}}-{{value}}-id">\
            <span class="checkbox"><i class="icon-ok"></i></span>\
            <span class="label-text" ng-transclude></span>\
          </label></div>',
    replace: true,
    transclude: true,
    scope: {
      model: '=',
      name: '@',
      value: '@'
    }
  };
}]);
