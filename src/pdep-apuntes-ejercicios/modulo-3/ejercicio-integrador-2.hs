{-
1. Modelar un alumno, que define 
    -un nombre, 
    -la fecha de nacimiento, 
    -el legajo (sin dígito verificador), 
    -las materias que cursa 
    *-y el criterio para estudiar ante un parcial:
        a. algunos son estudiosos: estudian siempre 
        b. otros son hijos del rigor: estudian si el parcial tiene más de n preguntas 
        c. los cabuleros, que estudian si la materia tiene una cantidad
           impar de letras. 

2. Requerimientos
    -Modelar un parcial
    -Modelar el tipo que representa el criterio de estudio.
    -Modelar genéricamente un alumno.
    -Representar con la abstracción que crea más conveniente al criterio estudioso, 
     hijo del rigor y cabulero.
    -Modelar a Nico, un alumno estudioso
    -Hacer que Nico pase de ser estudioso a hijo del rigor (buscar una abstracción 
     lo suficientemente genérica)
    -Determinar si Nico va a estudiar para el parcial de Paradigmas

3. Modelar un parcial
Para resolver este requerimiento, tenemos que abstraer la información necesaria 
para poder resolver lo que hoy nos piden. Ciertamente, hay mucha información 
que un parcial puede tener:
    -hora de comienzo
    -hora de fin
    -el profesor que lo toma
    -la materia
    -el aula
    -la cantidad de alumnos presentes
    -la cantidad de preguntas
    -las preguntas propiamente dichas...

Entre otros datos. Pero en este enunciado, solamente nos importan dos cosas: 
la materia (para los cabuleros) y la cantidad de preguntas que tiene un parcial 
(para los hijos del rigor). 

Esta técnica que empleamos toma en cuenta lo que nos interesa y 
descarta lo que no es esencial para la solución, proceso que se suele 
llamar abstracción.

-}
import Text.Show.Functions

data Alumno = Alumno{
    nombre :: String,
    fechaNacimiento :: (Int, Int, Int),
    materias: [String],
    legajo :: Int
} deriving (Show)

juan = Alumno {
    nombre = "Juan",
    legajo = 35216118
}
