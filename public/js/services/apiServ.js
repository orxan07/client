(function (module) {
	"use strict";
	module.factory('apiServ', apiServ);
	apiServ.$inject = ['$http'];
	function apiServ ($http) {
		var url = "http://localhost:8080"
		return {
			get: function () {
				return $http.get(url +'/api/todos');
			},
			create: function (todoData) {
				return $http.post(url + '/api/todos', todoData);
			},
			delete: function (id) {
				return $http.delete(url + '/api/todos/' + id);
			}
		}
	}
}(angular.module("app")))