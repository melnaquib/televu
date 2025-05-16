#!/usr/bin/python3

import sys
import hl7

def main():
    name = sys.argv[1]
    did = sys.argv[2]

    buffer = open("orm_o01.hl7", "r").read()
    msg = hl7.parse(buffer)
    # x = msg.segment('PID').field('5.1')
    print(msg)
    # x = msg.segment('PID').field('6.1')
    # print(x)

    # print(str(msg))

if __name__ == "__main__":
    main()
