
#Clase 6: Estad�stica espacial
#Fecha: Febrero 19 de 2016
#Autor: Juan Pablo Valencia Arango
#Tema: Gr�ficos para funciones Gausianas y Exponencial


#Generaci�n de secuencia de valores en los que se evaluar�n las funciones
mu <- seq(0, 10, length=100)

#Valor de referencia para identificar rango pr�ctico
a=0.05

# Gr�ficas para diferentes valores de phi
phi=10
rho_u1=exp(-(mu/phi)) #Funci�n exponencial
rho_u12=exp(-(mu/phi)^2)#Funci�n Gaussiana

phi=3
rho_u2=exp(-(mu/phi))#Funci�n exponencial
rho_u22=exp(-(mu/phi)^2)#Funci�n Gaussiana

phi=1
rho_u3=exp(-(mu/phi))#Funci�n exponencial
rho_u32=exp(-(mu/phi)^2)#Funci�n Gaussiana

phi=0.5
rho_u4=exp(-(mu/phi))#Funci�n exponencial
rho_u42=exp(-(mu/phi)^2)#Funci�n Gaussiana


#Gr�fica de todos los casos en una sola ventana.
# Funci�n Exponencial: Color rojo
# Funci�n Gausiana: Color azul

par(mfrow = c(2, 2))#Divide la pantalla de graficaci�n en dos filas y dos columnas
plot(mu,rho_u1,type="l",col="red",main="Rho 10")
lines(mu,rho_u12,type="l",col="blue")
abline(a,0)  
    
    
plot(mu,rho_u2,type="l",col="red",main="Rho 3")
lines(mu,rho_u22,type="l",col="blue")
abline(a,0)

plot(mu,rho_u3,type="l",col="red",main="Rho 1")
lines(mu,rho_u32,type="l",col="blue")
abline(a,0)


plot(mu,rho_u4,type="l",col="red",main="Rho 0.5")
lines(mu,rho_u42,type="l",col="blue")
abline(a,0)
