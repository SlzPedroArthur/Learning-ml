%Code based on the source material availabe in the Stanfors's ML course.

%Cost funcion
function J = computeCost(features, target, theta)
   examples = length(target);
   J = 0;

   h_approx = features * theta - target;
   J = h_approx' * h_approx / (2 * examples);
end

%Gradiente 
function [theta, J_history] = gradientDescentMulti (features, target, theta, alpha, iterations)
   examples = length(y);
   
   for i = 1: iterations
      h_approx = features * theta - target;
      
      theta = theta - (alpha/examples) * features' * (h_approx);

      
