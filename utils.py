import difflib
import json
import os


stored_files_dir = 'stored_files'
dir_files_file = 'file_map'


def diff_contents(from_contents, to_contents, **kwargs):
  return '\n'.join(difflib.unified_diff(from_contents.split('\n'), to_contents.split('\n'), lineterm='', **kwargs))

def input_bool(prompt):
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

def load_actual_file(filename, directory):
  return open(os.path.join(directory, filename), 'r').read()

def load_stored_files():
  return {
    filename: open(stored_file_path(filename), 'r').read()
    for filename in os.listdir(stored_files_dir)
  }

def load_file_dirs():
  file_dirs = {}
  for dir_files in json.load(open(dir_files_file, 'r')):
    for filename in dir_files['files']:
      assert filename not in file_dirs, 'Duplicate filenames currently not supported (even across different directories).'
      file_dirs[filename] = dir_files['directory'].replace('~', os.environ['HOME'])
  return file_dirs

def stored_file_path(filename):
  return os.path.join(stored_files_dir, filename)
