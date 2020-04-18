% {
# include  < stdio.h >
# include  < stdlib.h >
# include  < string.h >
%}

% opción  noyywrap
% opción  yylineno

pr @ (si | más | mientras)
letra [ A - Za - z ]
letra_ _ | { letra }
digito [ 0 - 9 ]
id # ({ letra_ } | { digito }) *
arit  " + " | " - " | " * " | " / " | " % "
relac  " > " | " < " | " > = " | " <= " | " == "
asign  " = "
lógica v
op { arit } | { asignada } | { relac } | { lógica }
sign_punt [ ,; ]
comentario  " / " (~ ( " / " )) " * / "
espacios [ \ t \ n \ r ] + 

%%

{ pr } { printf ( " Se encontró una palabra reservada:% s \ n " , yytext);}
{ id } { printf ( " Se encontró un id:% s \ n " , yytext);}
{ operador } { printf ( " Se encontró un operador:% s \ n " , yytext);}
{ sign_punt } { printf ( " Se encontró un símbolo de puntuación:% s \ n " , yytext);}
{ espacios } { / * Ignorar los espacios * / }
{ comentario } { / * Ignorar los comentarios * / }

%%

int  main ( int argc, char ** argv) {
    ARCHIVO * f;
    if (argv < 2 ) {
        printf ( " Falta agregar el archivo " );
        salida (- 1 );
    }
    f = fopen (argv [ 1 ], " r " );
    si (! f) {
        printf ( " No se pudo abrir el archivo seleccionado " );
        salida (- 1 );
    }
    yyin = f;
    yylex ();
    devuelve  0 ;

}
