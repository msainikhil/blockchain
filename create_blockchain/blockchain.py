# module 1 create blockchain
# source : https://www.udemy.com/build-your-blockchain-az

import datetime
import hashlib
import json
from flask import Flask, jsonify

# Building a blockchain
class Blockchain:
    
    def __init__(self):
        self.chain = []
        self.create_block(proof = 1, previous_hash = '0')


#Mining a Block