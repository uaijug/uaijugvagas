<!doctype html>
<html ng-app>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <script src="http://code.angularjs.org/1.0.7/angular.min.js"></script>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/css/bootstrap.min.css"/>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/js/bootstrap.min.js"></script>
    <script>
      function JobController($scope, $http) {
          $scope.jobs = [];
          
          $scope.loadJobs = function() {
             $http.get('jobs').success(function (job) {
               $scope.job = angular.fromJson(job);
             });
           };
          
          $scope.sendJob = function () {
            var pedido = {codigo: $scope.job.codigo, data: new Date()};
            $http.post('job/' + $scope.job.item.id, job).success(function () {
	            $scope.jobs.push(angular.copy($scope.job));
	          });
          };

          $scope.loadJobs();
      }
    </script>
  </head>
  <body ng-controller="JobController">
  
  </body>
</html>