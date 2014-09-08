#!/usr/bin/python

from __future__ import print_function

import os

from utils import (
  diff_contents,
  input_bool,
  load_actual_file,
  load_existing_files,
  load_file_dirs,
  stored_file_path,
)


def write_stored_file(filename, new_contents):
  with open(stored_file_path(filename), 'w') as f:
    f.write(new_contents)


def update_stored_file(filename, directory, existing_contents):
  new_contents = load_actual_file(filename, directory)
  path = os.path.join(directory, filename)
  diff = diff_contents(existing_contents, new_contents, fromfile=path, tofile=filename)
  if diff:
    print('Config file %s differs from the stored version:' % path)
    print(diff)
    if input_bool('Update stored config file %s?' % path):
      write_stored_file(filename, new_contents)


def add_stored_file(filename, directory):
  new_contents = load_actual_file(filename, directory)
  diff = diff_contents('', new_contents, tofile=filename)
  path = os.path.join(directory, filename)
  print('Config file %s is new:' % path)
  print(diff)
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
  existing_files = load_existing_files()
  for filename, directory in file_dirs.iteritems():
    if filename in existing_files:
      update_stored_file(filename, directory, existing_files[filename])
    else:
      add_stored_file(filename, directory)
  for filename, contents in existing_files.iteritems():
    if filename not in file_dirs:
      remove_stored_file(filename, contents)


if __name__ == '__main__':
  main()
