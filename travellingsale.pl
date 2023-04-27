% Define the problem
tsp(Cities, Distance) :-
permutation(Cities, Permutation), % Generate all possible permutations of cities
route_distance(Permutation, Distance), % Calculate the distance of each permutation
!. % Cut to stop backtracking after finding the first solution

% Calculate the distance of a route
route_distance([City1, City2 | Rest], Distance) :-
distance(City1, City2, CityDistance), % Calculate the distance between the two cities
route_distance([City2 | Rest], RestDistance), % Recursively calculate the distance of the rest of the route
Distance is CityDistance + RestDistance.

% Base case: empty route has distance 0
route_distance([_], 0).

% Define the distances between cities
distance(City1, City2, Distance) :-
city(City1, X1, Y1),
city(City2, X2, Y2),
Distance is sqrt((X1 - X2)^2 + (Y1 - Y2)^2).

% Define the cities and their coordinates
city(a, 2, 3).
city(b, 5, 2).
city(c, 7, 5).
city(d, 3, 6).
city(e, 8, 1).