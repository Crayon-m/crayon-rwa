"""
brownie run deploy.py --network mainnet-fork
"""

import os

from brownie import WRWAToken
import brownie

def load_accounts():
    admin_account = brownie.accounts.load("hsk-admin")

    return admin_account

def deploy_wrwatoken(admin_account, decimals):
    return admin_account.deploy(WRWAToken, decimals)

def main():
    admin_account = load_accounts()

    wrwatoken = deploy_wrwatoken(admin_account, 18)
    print(wrwatoken)
    
    
