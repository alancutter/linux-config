#!/usr/bin/python3

import os

from utils import (
  diff_contents,
  input_bool,
  load_actual_file,
  load_stored_files,
  load_file_dirs,
)


def ensure_directory(path):
  if os.path.exists(path):
    return
  os.makedirs(path)


def write_file(path, contents):
  with open(path, 'w') as f:
    f.write(contents)


def update_local_file(filename, directory, stored_contents):
  existing_contents = load_actual_file(filename, directory)
  if existing_contents != stored_contents:
    path = os.path.join(directory, filename)
    print('Stored config file %s differs from local version %s:' % (filename, path))
    print(diff_contents(existing_contents, stored_contents, fromfile=path, tofile=filename))
    if input_bool('Update contents of %s according to diff?' % path):
      write_file(path, stored_contents)


def add_local_file(filename, directory, stored_contents):
  path = os.path.join(directory, filename)
  print('Stored config file %s not present locally at %s:' % (filename, path))
  print(diff_contents('', stored_contents, fromfile=path, tofile=filename))
  if input_bool('Deploy local config file %s?' % path):
    write_file(path, stored_contents)


def deploy_stored_file(filename, directory, stored_contents):
  ensure_directory(directory)
  path = os.path.join(directory, filename)
  if os.path.exists(path):
    update_local_file(filename, directory, stored_contents)
  else:
    add_local_file(filename, directory, stored_contents)


def main():
  file_dirs = load_file_dirs()
  stored_files = load_stored_files()
  assert set(file_dirs) == set(stored_files), 'Stored config files must be updated to match file_map.json.'
  for filename, directory in file_dirs.iteritems():
    deploy_stored_file(filename, directory, stored_files[filename])


if __name__ == '__main__':
  main()
