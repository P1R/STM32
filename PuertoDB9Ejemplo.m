clear all;
close all;
clc

PS=serial('COM7');
set(PS,'Baudrate',9600); % se configura la velocidad a 9600 Baudios
set(PS,'StopBits',1); % se configura bit de parada a uno
set(PS,'DataBits',8); % se configura que el dato es de 8 bits, debe estar entre 5 y 8
set(PS,'Parity','none'); % se configura sin paridad
set(PS,'Terminator','CR/LF');% “c” caracter con que finaliza el envío 
set(PS,'OutputBufferSize',12); % ”n” es el número de bytes a enviar
set(PS,'InputBufferSize' ,12); % ”n” es el número de bytes a recibir
set(PS,'Timeout',5); % 5 segundos de tiempo de espera

fopen(PS);

fwrite(PS,12)
fread(PS)

fclose(PS);
delete(PS);
clear PS;