/*
    Convert Text input to mario 2 custom ascii file
    Producks 2024-07-20
*/

#include <unistd.h>
#include <stdio.h>
#include <string.h>

const static char magic_table[] = { 
    0x00, // Padding
    0x00, 
    0x00, 
    0x00,
    0x00,
    0x00,
    0x00, 
    0x00, 
    0x00,
    0x00,
    0x00,
    0x00, 
    0x00, 
    0x00,
    0x00,
    0x00,
    0x00, 
    0x00, 
    0x00,
    0x00,
    0x00,
    0x00, 
    0x00, 
    0x00, 
    0x00,
    0x00,
    0x00, 
    0x00, 
    0x00,
    0x00,
    0x00,
    0x00, 
    0x7D, // Space 
    0x40, // !
    0x00,
    0x00,
    0x00, 
    0x00, 
    0x00,
    0x00,
    0x00,
    0x00, 
    0x00, 
    0x00,
    0x00,
    0x00,
    0x00,
    0x00, 
    0x02, // 0
    0x03, // 1
    0x04, // 2
    0x05, // 3
    0x06, // 4
    0x07, // 5
    0x08, // 6
    0x09, // 7
    0x0A, // 8
    0x0B, // 9
    0x00,
    0x00,
    0x00,
    0x00, 
    0x00, 
    0x41, // ?
    0x00,
    0x20, // A
    0x21, // B
    0x22, // C
    0x23, // D
    0x24, // E
    0x25, // F
    0x26, // G
    0x27, // H
    0x28, // I
    0x29, // J
    0x2A, // K
    0x2B, // L missed the L RIP
    0x2C, // M
    0x2D, // N
    0x2E, // O
    0x2F, // P
    0x30, // Q
    0x31, // R
    0x32, // S
    0x33, // T
    0x34, // U
    0x35, // V
    0x36, // W
    0x37, // X
    0x38, // Y
    0x39, // Z
    0x00, 
    0x00,
    0x00,
    0x00,
    0x00,
    0x00, 
    0x60, // a
    0x61, // b
    0x62, // c
    0x63, // d
    0x64, // e
    0x65, // f
    0x66, // g
    0x67, // h
    0x68, // i
    0x69, // j
    0x6A, // k
    0x6B, // l
    0x6C, // m
    0x6D, // n
    0x6E, // o
    0x6F, // p
    0x70, // q
    0x71, // r
    0x72, // s
    0x73, // t
    0x74, // u
    0x75, // v
    0x76, // w
    0x77, // x
    0x78, // y
    0x79, // z
};

int main(int argc, char **argv)
{
    if (argc != 2){
        printf("No argument were provided\n");
        return 1;
    }
    FILE *file_stream = fopen("result.txt", "w");
    if (file_stream == NULL){
        perror("fopen");
        return 1;
    }
    fprintf(file_stream, "\t.db $XX, $XX, $%02lX\n\t.db", strlen(argv[1])); // Space for Adress location and the length get auto added
    for (int index = 0; argv[1][index]; index++){
        fprintf(file_stream, " $%02X", magic_table[argv[1][index]]);
        if (argv[1][index + 1] != '\0')
            fprintf(file_stream, ",");
    }
    fprintf(file_stream, "\n\t.db $00");
    fclose(file_stream);
    return 0;
}
