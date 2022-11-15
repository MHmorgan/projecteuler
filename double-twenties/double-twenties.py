#!/usr/bin/env python3

import statistics
import secrets
import random

import click
from click import echo


def throw_dices(num, rand):
    cnt = 0
    for _ in range(num):
        dice1 = rand()
        dice2 = rand()
        if dice1 == dice2 == 20:
            cnt += 1
    return cnt


@click.command()
@click.option('--num', default=400, help='Number of times per iteration')
@click.option('--iterations', default=50, help='Number of iterations')
def main(num, iterations):

    counts = []
    for i in range(iterations):
        cnt = throw_dices(num, lambda: secrets.randbelow(21))
        # cnt = throw_dices(num, lambda: random.randint(1, 20))
        counts.append(cnt)
        if not i % 1000:
            echo(f'\rIteration {i}', nl=False)
    echo()

    avg = statistics.mean(counts)
    echo(f'Average: {avg}')


main()
