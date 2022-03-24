#!/usr/bin/env python3

import subprocess
import re
from utils.pick import pick_bool

colour_stops = (
  (0.00, '#ffffff'),
  (0.25, '#ffff00'),
  (0.50, '#ff0000'),
  (1.00, '#323232'),
)

def execute(command):
  print(command)
  subprocess.call(command)

def get_cpu_count():
  with open('/proc/cpuinfo', 'r') as cpuinfo:
    return len(re.findall(r'^processor\s*:\s*\d+', cpuinfo.read(), re.MULTILINE))

def read_channel(colour, channel):
  index = 1 + channel * 2
  return int(colour[index:index + 2], 16)

def interpolate_channel(a, b, t, channel):
  start = read_channel(a, channel)
  end = read_channel(b, channel)
  return '{0:x}'.format(round(start + (end - start) * t)).zfill(2)

def interpolateColours(a, b, t):
  return '#' + ''.join(interpolate_channel(a, b, t, channel) for channel in range(3))

def get_colour(progress):
  for i in range(len(colour_stops) - 1):
    start = colour_stops[i]
    end = colour_stops[i + 1]
    if end[0] >= progress:
      return interpolateColours(start[1], end[1], (progress - start[0]) / (end[0] - start[0]))

def generate_dconf_colours(cpu_count):
  result = '['
  for i in range(cpu_count):
    if i > 0:
      result += ', '
    result += "({}{}, '{}')".format('uint32 ' if i == 0 else '', i, get_colour(i / cpu_count))
  result += ']'
  return result

def main():
  if not pick_bool('This is going to modify your dconf, continue?'):
    return

  cpu_count = get_cpu_count()
  print('Found %s CPUs.' % cpu_count)

  execute(['dconf', 'write', '/org/gnome/gnome-system-monitor/cpu-colors', generate_dconf_colours(cpu_count)])

if __name__ == '__main__':
  main()