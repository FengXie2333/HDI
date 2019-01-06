
# coding: utf-8


import argparse

parser = argparse.ArgumentParser()

parser.add_argument('-s',"--square", help="display a square of a given number", type=int)
parser.add_argument('-c',"--cubic", help="display a cubic of a given number", type=int)

args = vars(parser.parse_args())

print(args)
