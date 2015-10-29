from __future__ import print_function
import sys


def pick_item(items, prompt, file=sys.stdout):
  while True:
    for item in enumerate(items):
      print('%s: %s' % item, file=file)
    try:
      print(prompt + ': ', end='', file=file)
      return items[int(input())]
    except EOFError:
      print()
      return
    except KeyboardInterrupt:
      raise
    except:
      print('Invalid input')
