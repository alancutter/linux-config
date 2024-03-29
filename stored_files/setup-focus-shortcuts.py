#!/usr/bin/env python3

import subprocess
from utils.pick import pick_bool

namespace = 'org.cinnamon.desktop.keybindings.custom-keybinding'
path_template = '/org/cinnamon/desktop/keybindings/custom-keybindings/%s/'

def execute(command):
  print(command)
  subprocess.call(command)

def main():
  if not pick_bool('This is going to modify your gsettings, continue?'):
    return

  names = []

  def register_custom_binding(name, command, binding):
    path = path_template % name
    set_command = ['gsettings', 'set', namespace + ':' + path]
    execute(set_command + ['name', name])
    execute(set_command + ['command', command])
    execute(set_command + ['binding', str([binding])])
    names.append(name)

  for i in range(10):
    register_custom_binding('save-focus-%d' % i, 'bash -c "xdotool getwindowfocus > /tmp/focus%d"' % i, '<Control><Super>%d' % i)
    register_custom_binding('focus-%d' % i, 'bash -c "xdotool windowactivate $(cat /tmp/focus%d)"' % i, '<Super>%d' % i)

  execute(['gsettings', 'set', 'org.cinnamon.desktop.keybindings', 'custom-list', str(names)])

if __name__ == '__main__':
  main()