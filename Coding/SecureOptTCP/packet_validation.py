from scapy.all import sniff, IP, TCP
from collections import defaultdict
from time import time

# Dictionary to keep track of SYN packets from each source IP
syn_packet_count = defaultdict(int)

# Dictionary to keep track of the last time a packet was received from each source IP
last_packet_time = defaultdict(int)

# Time window for rate-limiting (in seconds)
TIME_WINDOW = 10

# Maximum allowed SYN packets within TIME_WINDOW
MAX_SYN_COUNT = 5

def packet_inspector(packet):
    # Inspect only IP and TCP layers
    if IP in packet and TCP in packet:
        src_ip = packet[IP].src

        # Check the last time a packet was received
        current_time = time()
        last_time = last_packet_time.get(src_ip, 0)

        # Reset packet counts if outside of TIME_WINDOW
        if current_time - last_time > TIME_WINDOW:
            syn_packet_count[src_ip] = 0

        last_packet_time[src_ip] = current_time

        # Count SYN packets
        if packet[TCP].flags == 'S':
            syn_packet_count[src_ip] += 1
            if syn_packet_count[src_ip] > MAX_SYN_COUNT:
                print(f"Rate limit exceeded for {src_ip}. Blocking.")

# Start sniffing
sniff(prn=packet_inspector)

