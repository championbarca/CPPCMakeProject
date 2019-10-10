// Type your code here, or load an example.
#include <string.h>

int square(char* num) {
    if (memcmp(num, "B6", 2) == 0)
        return 1;
    else
        return 0;
}

int square1(char* num) {
    if (num[0] == 'B' && num[1] == '6')
        return 1;
    else
        return 0;
}

int square2(char* num) {
    if (*(reinterpret_cast<int*>(num)) == 13890)
        return 1;
    else
        return 0;
}