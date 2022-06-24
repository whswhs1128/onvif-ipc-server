#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

//PORT
#define ONVIF_UDP_PORT 3702
#define ONVIF_TCP_PORT 5000

//IP
#define ONVIF_UDP_IP "239.255.255.250"
#define ONVIF_TCP_IP "192.168.1.66"

/*
* @brief ��ȡ�豸��IP��ַ�����Ի�ȡipv4����ipv6��ַ
*/
int get_ip_of_if(const char *if_name, int af, char *IP);

/*
* @brief ��ȡ�豸�ƶ��ӿڵ�mac��ַ
*/
int get_mac_of_if(const char *if_name, char *mac_addr, int mac_len);

/*
* @brief ��mac��ַת��Ϊ�ַ�����ʽ
*/
int macaddr2str(char *mac_addr, char *mac_str, int mac_len);


