#include <stdio.h>
#include <math.h>

/*
float calcula(float x) {
    f(x) = ...;
    atualiza x;
    atualiza f;
    
    return f_x;
}
*/

float zero() {
    float x, f, t;
    x = 100;
    
    while (t != x) {
        t = x;
        
        printf("Insira o valor de x: ");
        scanf("%f", &x);
            
        f = pow(x, 3) - 9*x + 3;
            
        printf("f = %.2f\n", f);
    }
    
    printf("\n");
    
    return f;
}

int teste() {
    float a, b, x, d_phi;
    d_phi = 3*pow(x, 2) - 8;
    
    printf("Insira o limite inferior do intervalo: ");
    scanf("%f", &a);
    printf("Insira o limite superior do intervalo: ");
    printf("%f\n", &b);
    
    printf("\n");
    
    d_phi = 3*pow(a, 2) - 8;
    if (fabs(d_phi) >= 1)
        return 0;
    else {
        d_phi = 3*pow(b, 2) - 8;
        if (fabs(d_phi) >= 1)
            return 0;
    }
    
    return 1;
}

int main()
{
    float x, phi;
    int t;

    //x = 0.375;
    x = zero();

    /*
    phi1 = ;
    phi2 = ;
    phi3 = ;
    phi4 = ;
    */

    t = teste();

    printf("%d\n\n", t);

    if (t) {
        for (int i = 0; i <= 10; i++) {
            phi = pow(x, 3) - 8*x + 3;
            x = phi;
            
            printf("valor do %do x: %f\n", i, x);
        }
    }

    return 0;
}