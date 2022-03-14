import sys


def pick_bool(prompt):
  while True:
    try:
      user_input = input(prompt + ' ([y]/n): ')
      if user_input in ('', 'y'):
        return True
      elif user_input == 'n':
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
