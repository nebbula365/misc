import requests
import os
import time
from progressbar import ProgressBar
import argparse
import logging

logger = logging.getLogger('DirB')
logging.basicConfig(level=logging.INFO)

parser = argparse.ArgumentParser()
parser.add_argument('--url', '-u')
parser.add_argument('--timeout', '-t', type=int)
parser.add_argument('--outfile', '-o')
args = parser.parse_args()

def wordlist():
    with open('/home/nebb/repo/wordlist/DirBuster-Lists/directory-list-1.0.txt', 'r') as f:
        data = f.readlines()
    return data
    # for line in data:
    #     line = line.strip()
    #     if line != '':
    #         logging.info(line)
    #     return line


def brute(wordlist):  
    pbar = ProgressBar()
    for line in pbar(wordlist):
        line = line.strip()
        if line != '':
            # path = 'http://127.0.0.1/dvwa/' # follow this format
            path = args.url
            res = requests.get(path + line)
            if res.status_code == 200:
                logger.info(path + line)
                if args.outfile:
                    with open(args.outfile, 'a') as f:
                        f.write(path + line + '\n')
            # if args.timeout:
            #     time.sleep(args.timeout)  


if __name__ == '__main__':
    if args.timeout:
        logger.info('{}s delay between requests'.format(args.timeout))
    if args.outfile:
        logger.info('Writing to {}'.format(args.outfile))
    
    # logger.info(wordlist())
    brute(wordlist())

    
