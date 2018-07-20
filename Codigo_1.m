#Código redigido por Rafael Rodrigues da Silva

clear all; close all; clc;



X1 = [
1.80,
1.86,
1.92,
1.96,
1.65,
1.72,
1.80,
1.78,
1.90,
1.87,
1.71,
1.69,
1.65,
1.87,
1.80,
1.90,
1.62,
1.55,
1.70,
1.91]

X2 = [
60,
78,
92,
77,
52,
60,
76,
58,
96,
82,
63,
57,
53,
73,
70,
77,
63,
58,
72,
70]





# MEDIA DAS VARIAVEIS ALEATORIAS
printf ("Media de X1 is %d \n",mean(X1)); # AQUI PRINTA A MEDIA DE X1
printf("Media de X2 is %d \n",mean(X2)); #AQUI PRINTA A MEDIA DE X2
# MEDIA DAS VARIAVEIS ALEATORIAS







# MEDIANA DAS VARIAVEIS ALEATORIAS

#  MEDIANA DE X1
X1_size = size(X1);
X1_sorted = X1;
X1_sorted = sort(X1_sorted);
#printf("%d \n",X2_sorted);

if (mod(X1_size(1),2) == 1)
    
     X1_mediana_pos = (X1_size(1)+1)/2;
     printf("A mediana de X1 is %d \n",X1_sorted(X1_mediana_pos));

elseif (mod(X1_size(1),2) == 0)
      
      X1_mediana = (X1_sorted(X1_size(1)/2)+X1_sorted((X1_size(1)/2)+1))/2;
      printf("A mediana de X1 is %d \n",X1_mediana);
endif
#  MEDIANA DE X1







#  MEDIANA DE X2
X2_size = size(X2);
X2_sorted = X2;
X2_sorted = sort(X2_sorted);
#printf("%d \n",X2_sorted);

if (mod(X2_size(1),2) == 1)
    
     X2_mediana_pos = (X2_size(1)+1)/2;
     printf("A mediana de X2 is %d \n",X2_sorted(X2_mediana_pos));

elseif (mod(X2_size(1),2) == 0)
      
      X2_mediana = (X2_sorted(X2_size(1)/2)+X2_sorted((X2_size(1)/2)+1))/2;
      printf("A mediana de X2 is %d \n",X2_mediana);
endif
#  MEDIANA DE X2

# MEDIANA DAS VARIAVEIS ALEATORIAS







# DESVIO PADRAO DAS VARIAVEIS ALEATORIAS
DesvioP_X1 = std(X1);
DesvioP_X2 = std(X2);

printf("Desvio padrao de X1 is %d\n",DesvioP_X1);
printf("Desvio padrao de X2 is %d\n",DesvioP_X2);
# DESVIO PADRAO DAS VARIAVEIS ALEATORIAS









# VARIANCIA DAS VARIAVEIS ALEATORIAS
Variancia_X1 = DesvioP_X1^2;
Variancia_X2 = DesvioP_X2^2;

printf("Variancia de X1 is %d\n",Variancia_X1);
printf("Variancia de X2 is %d\n",Variancia_X2);
# VARIANCIA DAS VARIAVEIS ALEATORIAS











# CORRELACAO ENTRE AS VARIAVEIS ALEATORIAS
cor_X1_X1 = corr(X1,X2);
printf("A correlacao entre X1 e X2 is %d",cor_X1_X1);
# CORRELACAO ENTRE AS VARIAVEIS ALEATORIAS









# HISTOGRAMA DAS VARIAVEIS ALEATORIAS

hist(X1,24); figure 2;
hist(X2,24);

# HISTOGRAMA DAS VARIAVEIS ALEATORIAS








# REGRESSAO LINEAR DAS VARIAVEIS ALEATORIAS E DIAGRAMA DE DISPERCAO
n = X1_size(1)
X1_square = X1;
for i = 1:X1_size(1)  # ESSE FOR E PRA CALCULAR O VALOR DE X1^2
  
  X1_square(i) = X1(i)*X1(i);
  
endfor

b = ((n*sum(X1 .* X2)) - sum(X1)*sum(X2))  /  (  (n *   sum(X1_square)) - (sum(X1)^2)  ) #FORMULA DO COEFICIENTE B

a = mean(X2) - (b*mean(X1)) # FORMULA DO COEFICIENTE A

Regression = a + b*X1 # EQUACAO DA RETA DE REGRESSAO 

DesvioP_Regression = std(Regression);

figure 3;
plot(X1,X2,".b");hold on;
plot(X1,Regression);


# REGRESSAO LINEAR DAS VARIAVEIS ALEATORIAS E DIAGRAMA DE DISPERCAO










# ERRO MEDIO 


erro_medio = X2 - Regression;
printf("O erro padrao de cada valor da reta is \n");
printf("%d\n",erro_medio);

# ERRO MEDIO 









# ERRO ABSOLUTO

Len_erroM = size(erro_medio);
erro_abs = erro_medio;
for i = 1:Len_erroM(1)
  
  if (erro_abs(i)<0)
    disp(erro_abs(i));
    erro_abs(i) = erro_abs(i)*(-1);
  
  endif
  
endfor

printf("O erro absoluto de cada valor da reta is \n");
printf("%d\n",erro_abs);


# ERRO ABSOLUTO








# x = randi([0 100],1,1000);hist(x,30)