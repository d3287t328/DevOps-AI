import json
import logging

# Initialize logging
logging.basicConfig(filename='network_activity.log', level=logging.INFO)

def read_config(file_path):
    with open(file_path, 'r') as f:
        config = json.load(f)
    return config

def update_rate_limits(src_ip, new_limit):
    logging.info(f"Rate limit updated for {src_ip}: {new_limit}")

def log_suspicious_activity(src_ip, activity_type):
    logging.warning(f"Suspicious activity detected: {activity_type} from {src_ip}")

def log_blocked_ip(src_ip):
    logging.critical(f"IP Blocked: {src_ip}")

def log_general_activity(message):
    logging.info(message)

