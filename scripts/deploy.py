"""
brownie run deploy.py --network mainnet-fork
"""

import os

from brownie import WRWAToken
import brownie

def load_accounts():
    admin_account = brownie.accounts.load(adm)

    return admin_account

def deploy_wrwatoken(admin_account, dev_account):
    return admin_account.deploy(WRWAToken, dev_account)

def main():
    admin_account = load_accounts()

    # deploy XCRAY contract
    wrwatoken = deploy_wrwatoken(admin_account, 18)
    
    
