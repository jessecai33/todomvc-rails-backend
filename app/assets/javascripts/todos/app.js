/*global angular */

/**
 * The main TodoMVC app module
 *
 * @type {angular.Module}
 */
var todomvc = angular.module('todomvc', ['ngRoute']).config(function ($routeProvider) {
	'use strict';

	var routeConfig = {
		controller: 'TodoCtrl',
		templateUrl: 'index.html.erb',
		resolve: {
			store: function (todoStorage) {
				// Get the correct module (API or localStorage).
				return todoStorage.then(function (module) {
					module.get(); // Fetch the todo records in the background.
					return module;
				});
			}
		}
	};

	$routeProvider
		.when('/', routeConfig)
		.when('/:status', routeConfig)
		.otherwise({
			redirectTo: '/'
		});
});

todomvc.config(["$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }
]);
