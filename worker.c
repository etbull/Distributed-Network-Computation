#include <stdio.h>
#include <arpa/inet.h>
#include <sys/socket.h>

int main() {
    printf("Worker Initiated!\n");
    int sock = socket(AF_INET, SOCK_DGRAM, 0);

    struct sockaddr_in me = {
        .sin_family = AF_INET,
        .sin_port = htons(9000),
        .sin_addr.s_addr = INADDR_ANY
    };
    bind(sock, (struct sockaddr*)&me, sizeof(me));

    int payload;
    struct sockaddr_in sender;
    socklen_t sender_len = sizeof(sender);

    recvfrom(sock, &payload, sizeof(payload), 0, (struct sockaddr*)&sender, &sender_len);
    printf("Received: %d\n", payload);

    // "compute" something - just double it
    payload *= 2;

    sendto(sock, &payload, sizeof(payload), 0, (struct sockaddr*)&sender, sender_len);
    printf("Sent back: %d\n", payload);

    return 0;
}