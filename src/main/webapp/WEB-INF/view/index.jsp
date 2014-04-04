<!doctype html>
<html ng-app>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script src="http://code.angularjs.org/1.2.6/angular.min.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script>
	function JobController($scope, $http) {
		$scope.jobs = [];

		$scope.loadJobs = function() {
			$http.get('jobs').success(function(jobs) {
				$scope.jobs = angular.fromJson(jobs);
			});
		};

		$scope.submitJob = function(isValid) {
			if (isValid) {
				var job = angular.copy($scope.job);

				$http.post('job', job).success(function() {
					$scope.jobs.push(job);

					$('#jobModalForm').modal('hide');
				});
			}
		};

		$scope.loadJobs();
	}
</script>
</head>
<body ng-controller="JobController">
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
		<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#jobModalForm">Nova Vaga</button>
	</div>

	<div class="modal fade" id="jobModalForm">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Nova vaga</h4>
				</div>
				<div class="modal-body">
					<form name="addJobForm" novalidate>
						<div class="form-group" ng-class="{'has-error': addJobForm.company.$invalid && addJobForm.company.$dirty}">
							<input type="text" class="form-control" style="width: 480px;" ng-model="job.company" name="company" placeholder="Empresa" ng-required="true" />
							<p ng-show="addJobForm.company.$invalid && addJobForm.company.$dirty" class="help-block">O campo Empresa é obrigatorio</p>
						</div>
						<div class="form-group" ng-class="{'has-error': addJobForm.description.$invalid && addJobForm.description.$dirty}">
							<input type="text" class="form-control" style="width: 480px;" ng-model="job.description" name="description" placeholder="Descrição" ng-required="true" />
							<p ng-show="addJobForm.description.$invalid && addJobForm.description.$dirty" class="help-block">O campo Descrição é obrigatorio</p>
						</div>
						<div class="form-group" ng-class="{'has-error': addJobForm.email.$invalid && addJobForm.email.$dirty}">
							<input type="email" class="form-control" style="width: 480px;" ng-model="job.email" name="email" placeholder="Email" ng-required="true" />
							<p ng-show="addJobForm.email.$invalid && addJobForm.email.$dirty" class="help-block">O campo Email é obrigatorio ou não é um email válido</p>
						</div>
						<div class="form-group" ng-class="{'has-error': addJobForm.position.$invalid && addJobForm.position.$dirty}">
							<input type="text" class="form-control" style="width: 350px;" ng-model="job.position" name="position" placeholder="Cargo" ng-required="true" />
							<p ng-show="addJobForm.position.$invalid && addJobForm.position.$dirty" class="help-block">O campo Cargo é obrigatorio</p>
						</div>
						<div class="form-group" ng-class="{'has-error': addJobForm.title.$invalid && addJobForm.title.$dirty}">
							<input type="text" class="form-control" style="width: 350px;" ng-model="job.title" name="title" placeholder="Titulo" ng-required="true" />
							<p ng-show="addJobForm.title.$invalid && addJobForm.title.$dirty" class="help-block">O campo Titulo é obrigatorio</p>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
					<button type="button" class="btn btn-primary" ng-click="submitJob(addJobForm.$valid)" ng-disabled="addJobForm.$invalid">Salvar</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>