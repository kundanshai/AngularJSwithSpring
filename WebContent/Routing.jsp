<html ng-app='routingDemoApp'>
    <head>
        <title>RoutingDemo App</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular-route.js"></script>
<!-- Adding the ng-app declaration to initialize AngularJS -->
<div id="main">
	<!-- The navigation menu will get the value of the "active" variable as a class.
		 The $event.preventDefault() stops the page from jumping when a link is clicked. -->

	<nav class="{{active}}" ng-click="$event.preventDefault()">

		<!-- When a link in the menu is clicked, we set the active variable -->

		<a href="#" class="home" ng-click="active='home'">Home</a>
		<a href="#" class="projects" ng-click="active='projects'">Projects</a>
		<a href="#" class="services" ng-click="active='services'">Services</a>
		<a href="#" class="contact" ng-click="active='contact'">Contact</a>
	</nav>

	<!-- ng-show will show an element if the value in the quotes is truthful,
		 while ng-hide does the opposite. Because the active variable is not set
		 initially, this will cause the first paragraph to be visible. -->

	<p ng-hide="active">Please click a menu item</p>
	<p ng-show="active">You chose <b>{{active}}</b></p>
</div>
    
        <title>RoutingDemo App</title>
   
    <script type="text/javascript">
        var app = angular.module('routingDemoApp', []);

    	app.controller('myCtrol', function($scope) {
    		$scope.myObj = {  
	        	    "color" : "white",  
	        	    "background-color" : "brown",  
	        	    "font-size" : "20px",  
	        	    "padding" : "10px" 
    		};
    		});  
        </script>
        
        </head>
    <body>
    <div >
      <form>  
  <h3 ng-style="myObj">Pick a topic:  </h3>
  <input type="radio" ng-model="myVar" value="tuts">Tutorials  
  <input type="radio" ng-model="myVar" value="fest">Festivals  
  <input type="radio" ng-model="myVar" value="news">News  
</form>  
<div ng-switch="myVar">  
  <div ng-switch-when="tuts">  
     <h1>Tutorials</h1>  
     <p>Welcome to the best tutorials over the net</p>  
  </div>  
  <div ng-switch-when="fest">  
     <h1>Festivals</h1>  
     <p>Most famous festivals</p>  
  </div>  
  <div ng-switch-when="news">  
     <h1>News</h1>  
     <p>Welcome to the news portal.</p>  
  </div>  
</div>  
<p>The ng-switch directive hides and shows HTML sections depending on the value of the radio buttons.</p>  
  </div>
  
  <div>
        <h2>AngularJS Routing Application</h2>
        <ul>
            <li><a href="#/">Default Route</a></li>
            <li><a href="#/computers">Computer Route</a></li>
            <li><a href="#/printers">Printers Route</a></li>
            <li><a href="#/blabla">Unknown Route</a></li>
        </ul>
         
        <div ng-view></div>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular-route.js"></script>
        <script>
            angular.module('routingDemoApp',['ngRoute'])
            .config(['$routeProvider', function($routeProvider){
                $routeProvider
                .when('/',{template:'This is the default Route'})
                .when('/computers',{template:'This is the computers Route'})
                .when('/printers',{template:'This is the printers Route'})
                .otherwise({redirectTo:'/'});
            }]);
        </script>

</div>

    </body>
</html>

