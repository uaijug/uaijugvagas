<!doctype html>
<html ng-app>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script src="http://code.angularjs.org/1.0.7/angular.min.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script>
	function JobController($scope, $http) {
		$scope.jobs = [];

		$scope.loadJobs = function() {
			$http.get('jobs').success(function(jobs) {
				$scope.jobs = angular.fromJson(jobs);
			});
		};

		$scope.sendJob = function() {
			var pedido = {
				codigo : $scope.job.codigo,
				data : new Date()
			};
			$http.post('job/' + $scope.job.item.id, job).success(function() {
				$scope.jobs.push(angular.copy($scope.job));
			});
		};

		$scope.loadJobs();
	}
</script>
</head>
<body ng-controller="JobController">
	<div style="text-align: center; margin: 20px;">
		<a href="http://www.agilecode.com.br"></a>
	</div>
	<div class="well" style="width: 700px; margin-top: 60px; margin-left: auto; margin-right: auto;">
		<table class="table table-striped">
			<tr>
				<th>Empresa</th>
				<th>Descrição</th>
				<th>Email</th>
				<th>Cargo</th>
				<th>Titulo</th>
			</tr>
			<tr ng-repeat="job in jobs">
				<td>{{job.company}}</td>
				<td>{{job.description}}</td>
				<td>{{job.email}}</td>
				<td>{{job.position}}</td>
				<td>{{job.title}}</td>
			</tr>
		</table>
	</div>
</body>
</html>