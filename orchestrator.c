#include <stdio.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/socket.h>

int main() {
    int sock = socket(AF_INET, SOCK_DGRAM, 0);
    
    struct sockaddr_in worker = {
        .sin_family = AF_INET,
        .sin_port = htons(9000),
        .sin_addr.s_addr = inet_addr("10.0.0.2")
    };

    int payload = 42;
    sendto(sock, &payload, sizeof(payload), 0, (struct sockaddr*)&worker, sizeof(worker));
    printf("Sent: %d\n", payload);

    int result;
    recvfrom(sock, &result, sizeof(result), 0, NULL, NULL);
    printf("Got back: %d\n", result);

    return 0;
}