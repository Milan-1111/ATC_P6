%{
#include <stdio.h>
void yyerror(const char *s);
int yylex(void);
%}

/* Token */
%token NUMBER

%%

expr:
      expr '+' expr
    | expr '*' expr
    | '(' expr ')'
    | NUMBER
    ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter expression:\n");
    yyparse();
    return 0;
}