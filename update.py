#!/usr/bin/python3

import os

from utils import (
  diff_contents,
  input_bool,
  load_actual_file,
  load_stored_files,
  load_file_dirs,
  stored_file_path,
)


def write_stored_file(filename, new_contents):
  with open(stored_file_path(filename), 'w') as f:
    f.write(new_contents)


def update_stored_file(filename, directory, stored_contents):
  new_contents = load_actual_file(filename, directory)
  path = os.path.join(directory, filename)
  if stored_contents != new_contents:
    print('Config file %s differs from the stored version:' % path)
    print(diff_contents(stored_contents, new_contents, fromfile=path, tofile=filename))
    if input_bool('Update stored config file %s?' % path):
      write_stored_file(filename, new_contents)


def add_stored_file(filename, directory):
  new_contents = load_actual_file(filename, directory)
  path = os.path.join(directory, filename)
  print('Config file %s is new:' % path)
  print(diff_contents('', new_contents, tofile=filename))
  if input_bool('Store config file %s?' % path):
    write_stored_file(filename, new_contents)


def remove_stored_file(filename, contents):
  diff = diff_contents(contents, '', fromfile=filename)
  print('Stored config file %s is no longer mapped to a directory:' % filename)
  print(diff)
  if input_bool('Remove stored config file %s?' % filename):
    os.remove(stored_file_path(filename))


def main():
  file_dirs = load_file_dirs()
  stored_files = load_stored_files()
  for filename, directory in file_dirs.items():
    if filename in stored_files:
      update_stored_file(filename, directory, stored_files[filename])
    else:
      add_stored_file(filename, directory)
  for filename, contents in stored_files.items():
    if filename not in file_dirs:
      remove_stored_file(filename, contents)


if __name__ == '__main__':
  main()
