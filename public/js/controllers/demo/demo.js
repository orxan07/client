(function (module) {
    "use strict";

    module.controller("demoCtrl", demoCtrl);
    demoCtrl.$inject = ["$http","demoServ","demoServ"];
    function demoCtrl($http,demoServ) {
        var vm = this;

        vm.formData = {name:''};
        vm.users = [];


             demoServ.getAll().then(
                function (data) {
                    vm.users = data;
                },
                function (err) {
                });


        // CREATE ==================================================================
        // when submitting the add form, send the text to the node API
        vm.create = function() {

            demoServ.create(vm.formData).then(function (data) {
                    vm.formData = {}; // clear the form so our user is ready to enter another
                    vm.users = data; // assign our new list of users
                },
                function (err) {
                });
        };

        // DELETE ==================================================================
        // delete a todo after checking it
        vm.delete = function(id) {
            demoServ.deleteTodo(id)
                .then(function (data) {

                    demoServ.getAll().then(
                        function (data) {
                            vm.users = data;
                        },
                        function (err) {
                        });
                },
                function (err) {
                });
        };





    }

})(angular.module("app"));