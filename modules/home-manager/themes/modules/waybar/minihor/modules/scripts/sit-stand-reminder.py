#!/usr/bin/env python3

import os
import time
import argparse
import socket
from threading import Thread
from multiprocessing import Process,Pipe


HOST = '127.0.0.1'
PORT = 10001

is_paused = False
current_state = 'sitting'
skipping = False

parser = argparse.ArgumentParser(
                    prog='DeskReminder',
                    description='Reminds you to stand up or sit down for some period.',
                    )


def check_positive_int(value):
    try:
        value = int(value)
        if value <= 0:
            raise argparse.ArgumentTypeError("{} is not a positive integer".format(value))
    except ValueError:
        raise Exception("{} is not an integer".format(value))
    return value


def print_waybar_data(current_time):
    global current_state
    mins, secs = divmod(current_time, 60)
    print("{{\"text\": \"{:02d}:{:02d}\", \"alt\": \"{}\"}}".format(
        mins,
        secs,
        current_state,
        ), flush=True)


def countdown(t):
    global is_paused
    global skipping
    while t:
        print_waybar_data(t)
        time.sleep(1)
        if not is_paused:
            t -= 1
        if skipping:
            skipping = False
            break


def print_data_thread():
    global current_state
    while (1):
        os.system('notify-send "Sitting Reminder" "Please Sit Down!"')
        current_state = "sitting"
        countdown(args.minutes_sitting * 60)
        os.system('notify-send "Standing Reminder" "Please Stand Up!"')
        current_state = "standing"
        countdown(args.minutes_standing * 60)


def set_paused(paused):
    global is_paused
    is_paused = paused


def skip_state():
    global skipping
    skipping = True


def server_thread():
    MAX_LENGTH = 1024
    serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    serversocket.bind((HOST, PORT))
    serversocket.listen(2)
    while 1:
        #accept connections from outside
        (clientsocket, address) = serversocket.accept()
        buf = clientsocket.recv(MAX_LENGTH)
        cmd = buf.decode("utf-8")
        if cmd == "toggle_pause":
            global is_paused
            set_paused(not is_paused)
        elif cmd == "skip":
            skip_state()
        else:
            #print("unknown command")
            clientsocket.close()


def send_command(cmd):
    s = socket.socket()
    s.connect((HOST, PORT))
    s.send(bytes(cmd, "utf-8"))


if __name__ == "__main__":

    subparsers = parser.add_subparsers(dest="command")
    parser_serve = subparsers.add_parser('serve')
    parser_serve.add_argument("minutes_sitting", type=check_positive_int)
    parser_serve.add_argument("minutes_standing", type=check_positive_int)

    subparsers.add_parser("toggle_pause")
    subparsers.add_parser("skip")

    args = parser.parse_args()

    if args.command == "serve":
        Thread(target=print_data_thread, args=()).start()
        Thread(target=server_thread, args=()).start()
    else:
        send_command(args.command)
    
