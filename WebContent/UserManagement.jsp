<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Management</title>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular-route.js"></script>
<script type="text/javascript">
	var app = angular.module('myapp', []);

	app.controller('myappcontroller', function($scope, $http) {
		$scope.users = []
		$scope.userform = {
			name : "",
			department : ""
		};
		
	        setTimeout(function(){
	          $scope.search = 'JACK';
	          $scope.$apply();
	        }, 4000);
	        
	        $scope.myObj = {  
	        	    "color" : "white",  
	        	    "background-color" : "brown",  
	        	    "font-size" : "20px",  
	        	    "padding" : "10px"  
	        	  }  
		getUserDetails();

		function getUserDetails() {
			$http({
				method : 'GET',
				url : 'userdetails',
				header: {
					'Content-Type' : 'application/json'
				}
				
			}).then(function successCallback(response) {
				$scope.users = response.data;
			}, function errorCallback(response) {
				console.log(response.statusText);
			});
		}

		$scope.processUser = function() {
			 
			$http({
				method : 'POST',
				url : 'user',
				data : angular.toJson($scope.userform),
				headers : {
				'Content-Type' : 'application/json'
				}
			
			}).then(clearForm())
			  .success(function(data){
				$scope.users= data
		    });
		}
		$scope.editUser = function(user) {
			$scope.userform.name = user.name;
			$scope.userform.department = user.department;
			disableName();
		}
		$scope.deleteUser = function(user) {
			$http({
				method : 'DELETE',
				url : 'deleteuser',
				data : angular.toJson(user),
				headers : {
					'Content-Type' : 'application/json'
				}
			}).then(getUserDetails());
		}

		function clearForm() {
			$scope.userform.name = "";
			$scope.userform.department = "";
			$scope.userform.phone = "";
			document.getElementById("name").disabled = false;
		};
		function disableName() {
			document.getElementById("name").disabled = true;
		}
	});
</script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body ng-app="myapp" ng-controller="myappcontroller">
	<h3 ng-style="myObj">User Registration Form</h3>
	<form name="myForm" ng-submit="processUserDetails()">
		<div class="table-responsive">
			<table class="table table-bordered" style="width: 600px">
				<tr>
					<td>User Name</td>
					<td><input type="text" name="name" id="name" ng-model="userform.name"  required />
				<span style="color:red">
				<span ng-show="myForm.name.$error.required">UserName is required</span>
				<span>{{userform.name}}</span>
					</span>	
						</td>
						
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" id="department" name="department" ng-model="userform.department" required />
					<span style="color:red">
					<span ng-show="myForm.department.$error.required">Email required ! </span>
					<span>{{userform.department}}</span>
					</span>
					</td>
						
				</tr>
				<tr>
					<td>Country </td>
					<td><input type="text"  name="phone" ng-model="userform.phone" required />
					<span style="color:red">
					<span ng-show="myForm.phone.$error.required">Country is required ! </span>
					<span>{{userform.phone}}</span>
					</span>
					</td>
						
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="btn btn-primary btn-sm" ng-click="processUser()" ng-disabled="myForm.$invalid"
						value="Create / Update User"/></td>
				</tr>
			</table>
			
		</div>
		<td>Search</td>
		<td><input type="text" ng-model="search" size="20" /></td>
	</form>
	<h3>Registered Users</h3>
	<div class="table-responsive">
		<table class="table table-bordered" style="width: 600px">
			<tr>
				<th>User Name</th>
				<th>Email</th>
				<th>Country</th>
				<th>Actions</th>
				
			</tr>

			<tr ng-repeat="user in users | filter : search">
				<td>{{ user.name |uppercase}}</td>
				<td>{{ user.department | uppercase}}</td>
				<td>{{ user.phone| uppercase}}</td>
				<td><a ng-click="editUser(user)" class="btn btn-primary btn-sm">Edit</a>
					| <a ng-click="deleteUser(user)" class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
		</table>
	</div>
	
	<a class="btn btn-large btn-info " href="Routing.jsp"><i class="glyphicon glyphicon-chevron-right"></i> &nbsp; Routing</a>
</body>
</html>