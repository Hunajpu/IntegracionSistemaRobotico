clear
clc

% Este es el programa principal que controla la simulación de la celda
% robótica en RoboDK.
% Autores: Fierro De La Rosa Abril Evangelina
%          Islas Estrada Luis Rafael         
%          Luna Reyes Rodrigo
%          Montero Rasgado Josue Emiliano
% Fecha: 30 de noviembre de 2021
% Instrucciones de ejecución y uso:
% 1.- Abrir RoboDK con el archivo 'Celda Robotica.rdk'
% 2.- Asegurarse de que el interprete de Python de RoboDK corra los scripts
% del programa. Puede probar con el script 'RunConveyor'.
% 3.- Desde el explorador de archivos de Matlab buscar la carpeta de RoboDK
% donde se almacena la API de Matlab (Típicamente se encuentra en
% C:/RoboDK/Matlab) y añadir esta carpeta al path de Matlab (click derecho 
% sobre la carpeta ->Add to Path-->Selected Folders).
% 4.- Ejecutar este script.
% 5.- Aparecera un cuadro de dialogo en el cual se puede seleccionar el
% tipo de chile que se desea insertar a la celda. Ingrese (1) para agregar
% un chile verde, (2) para el chile rojo y (3) para salir del programa. Es
% IMPORTANTE que se salga del programa directamente insertando el número 3
% para que la celda en RoboDK se limpie y los scripts se finalicen
% correctamente.


start_pose = [6.15826833971767e-17,0.999999949584566,0,226.877988561847;-0.999999949584566,6.15826833971767e-17,0,-6.83699965530968;0,0,1,93;0,0,0,1];

RDK = Robolink;
numChiles = 0;

% Obtenemos los elementos de la celda que vamos a utilizar
programa_banda = RDK.Item('',10);
banda = RDK.Item('Conveyor');
chile = RDK.Item('Part');

% Duplicamos el chile segun el valor que nos de el usuario
color = 3;
RDK.RunCode('RunConveyor');
RDK.RunCode('Robot1_PickChile');
RDK.RunCode('Robot2_PickChile');
prompt = {'Ingrese el color del chile (1/2):'};
dlgtitle = 'Input';
dims = [1 35];
definput = {'1'};
seguir = true;
while(seguir)
    color = inputdlg(prompt,dlgtitle,dims,definput);
    color = str2num(color{1});
    if color == 1
        RDK.RunCode('StopConveyor');
        chile.Copy();
        new_chile = RDK.Paste();
        numChiles = numChiles + 1;
        new_chile.setName(['Part Verde ' int2str(numChiles)]);
        new_chile.setPose(start_pose);
        new_chile.setVisible(1);
        new_chile.setParent(banda);
        color = 3;
        RDK.RunCode('RunConveyor');
        chiles(numChiles) = new_chile;
    elseif color == 2
        RDK.RunCode('StopConveyor');
        chile.Copy();
        new_chile = RDK.Paste();
        numChiles = numChiles + 1;
        new_chile.setName(['Part Rojo ' int2str(numChiles)]);
        new_chile.setPose(start_pose);
        new_chile.setVisible(1);
        new_chile.setParent(banda);
        color = 3;
        RDK.RunCode('RunConveyor');
        chiles(numChiles) = new_chile;
    elseif color == 0
        seguir = false;
    end
    if programa_banda.Busy() == false
        RDK.RunCode('RunConveyor');
    end
end
% Detener scripts
RDK.RunCode('StopConveyor');
RDK.RunCode('StopPicking');
for i = 1:numChiles
    chiles(i).Delete();
end