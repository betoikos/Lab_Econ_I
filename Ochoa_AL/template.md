# Título
    
Este es un template para que puedan subir su trabajo hecho en clase.
## Estructura básica de Markdown
Los párrafos se hacen dejando una línea sin caracteres entre líneas de código (es decir, para empezar un párrafo en lugar de "dar un sólo ENTER" se deben "dar dos ENTER").

Este es el segundo párrafo y así.

 
## Negritas, cursivas y combinación de negritas y cursivas

En los párrafos se puede incluir *texto en cursivas* poniendo las palabras entre asteriscos o bien entre guiones bajos como este otro _texto en cursivas_. 

Para **texto en negritas** se ponen las palabras entre asteriscos dobles o bien entre guiones bajos dobles como __este otro texto en negritas__.

Y, naturalmente, *cursivas y  **negritas** pueden combinarse* como pueden claramente ver.

### Listas

Para hacer listas enumeradas se pone número seguido de punto y un espacio: 

1. Elemento 1 de la lista enumerada
2. Elemento 2 de la lista enumerada
    1. Elemento 2.1 de la lista
    2. Elemento 2.2 de la lista
        1. Elemento 2.2.1 de la lista
        2. Elemento 2.1.2 de la lista
3. Elemento 3 de la lista enumerada
    1. Elemento 3.1 de la lista
    2. Elemento 3.2 de la lista
 
Para hacer listas sin enumerar:

* Uno
* Dos
* Tres
    - Sí
    - No
    - Quizá
    - 5
        - Sí que sí
        - No que no
    - ajam
* Cuatro

## Links
Link hacia google [aquí](https://www.google.com), y [aquí adelante](https://www.google.com "Google's Homepage") también pero con un "título" . 

Para que el link completo sea mostradoa se debe encerrar en signos de "menor que" y "mayor que" <http://www.github.com>.

### Añadir imágenes
Para que puedan poner imágenes que tengan en su carpeta:

![alt text](img/acdc.png "Letrero cuando se ubica el cursor encima.")

## Citas en bloque

Como dijo alguna Jack el destripador
> Vamos
>
> por
>
> partes.

## Código

    #tarea_1
    ##Ejercicio_4

    Ex1=0
    Ex2=-4
    Ex3=1
    Ey1=-1
    Ey2=4

    varx1=1
    varx2=4
    varx3=2
    vary1=1
    vary2=9

    covx1x2=-1
    covx1x3=0
    covx1y1=0
    covx1y2=1

    covx2x3=2
    covx2y1=-1
    covx2y2=-3

    covx3y1=0
    covx3y2=3
    covy1y2=-2

    # Inciso 1)

    #E[x]

    EX=t(t(c(Ex1,Ex2,Ex3)))  #se puede de las dos formas
    EX=matrix(c(Ex1,Ex2,Ex3))

    #var (x)
    varx=matrix(c(varx1,covx1x2,covx1x3,covx1x2,varx2,covx2x3,covx1x3,covx2x3,varx3),3)

    #var(y)

    vary=matrix(c(vary1,covy1y2,covy1y2,vary2),2) #hasta aqui notas 09/02/18


## Referencias para profundizar
La referencia oficial para la sintaxis de Markdown es [Daring Fireball](https://daringfireball.net/projects/markdown/syntax).

Si quieres volver a aprender lo básico de Markdown cono un tutorial práctico y muy didáctico puedes probar con [este](http://commonmark.org/help/tutorial/).


