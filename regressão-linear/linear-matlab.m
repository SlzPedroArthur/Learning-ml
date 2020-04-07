%Code based on the source material availabe in the Stanfors's ML course.

%Recomendo usar o marlab online para executar o código. Ele é gratuito por 30 dias.

%Função de Custo
function J = computeCost(features, target, theta)
   exNumber = length(target);
   J = 0;

   h_approx = features * theta - target;
   J = h_approx' * h_approx / (2 * exNumber);
end

%Gradiente 
function theta = gradientDescent(features, target, theta, alpha, iterations)
   exNumber = length(y);
   
   for i = 1: iterations
      h_approx = features * theta - target;
      
      theta = theta - (alpha/exNumber) * features' * (h_approx);

      cost_overtime = computeCost(features, target, theta);
   end
end

function [feature_norm, meanFeatures, sigmaDeviation] = dataNormalize(features)

   %Inicializando vetores para a manipulação
   feature_norm = X;
   meanFeatures = zeros(1, size(features, 2));
   sigmaDeviation = zeros(1, size(features, 2));

   %Fórmula: feature(i)ˆn - média_valores_feature(i) / variação_feature(i)
   mu = mean(X); %Calcula a média de todos 
   sigma = std(X);%Valor da variação

   %Obs.: Devemos normalizar um novo valor em x usando a média e o desvio
   %computados previamente.
   m = size(X,1); %Pega o tamanho para criar os vetores;

   X_norm = (X - repmat(mu, m, 1) ./ repmat(sigma, m, 1)); %Aplica a fórmula acima
   
   
end

%Carregando os dados
data = load('house_prices.txt');

%Salvando em diferentes vetores para realizar as operações
features = data(:, 1: 2);
target = data(:, 3);
exNumber = length(y);

%Otimizando o programa, normalizando os dados.
[features, meanFeatures, sigmaDeviation] = dataNormalize(features);

%Adicionando theta 0
features = [ones(exNumber, 1) features];

%Determinando alpha e o numero de interação. Criando também um vetor para saber a variação dos custo.
alpha = 0.1;
iterations = 500;
cost_overtime = zeros(iterations, 1);


%Inicializando theta com valores 0
theta = zeros(3, 1);
 
%Descobrindo os valores dos paramêtros
theta = gradientDescent(features, target, theta, alpha, iterations, cost_overtime);





