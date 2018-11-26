from __future__ import print_function
import sys


def pick_bool(prompt):
  while True:
    try:
      input = raw_input(prompt + ' ([y]/n): ')
      if input in ('', 'y'):
        return True
      elif input == 'n':
        return False
    except KeyboardInterrupt:
      raise
    except:
      print('Invalid input')

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
