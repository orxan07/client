(function (module) {
    "use strict";

    module.factory('demoServ', demoServ);
    demoServ.$inject = ["$http", "$q"];
    
    function demoServ($http, $q) {

        return {
            getAll: getAll,
            create: create,
            deleteTodo:deleteTodo,

        }


        function deleteTodo(id) {

            var deferred = $q.defer();


                $http({
                    method: 'DELETE',
                    url:'http://127.0.0.1/api/users/'+ id,
                }).success(function (data, status, headers, cfg) {
                        deferred.resolve(data);

                }).error(function (e, status) {

                    console.error(e);
                    deferred.reject(status);

                });


            return deferred.promise;
        };
        function create(obj) {

            var deferred = $q.defer();
                $http({
                    method: 'POST',
                    url: 'http://127.0.0.1/api/users',
                    data: obj,
                }).success(function (data, status, headers, cfg) {

                        deferred.resolve(data);

                }).error(function (e, status) {

                    console.error(e);
                    deferred.reject(status);

                });


            return deferred.promise;
        }



        function getAll() {

            var deferred = $q.defer();
            $http({
                method: 'GET',
                url: 'http://127.0.0.1/api/users',
            }).success(function (data, status, headers, config) {
                deferred.resolve(data);

            }).error(function (data) {
                deferred.reject(data);
            });


            return deferred.promise;
        }
    };



})(angular.module("app"));
