import re
import sys

def look_ahead(n, source_iter):
  buffer = []
  for x in source_iter:
    buffer.append(x)
    if len(buffer) > n:
      buffer.pop(0)
    if len(buffer) == n:
      yield list(buffer)

seen_errors = set()

for lines in look_ahead(3, sys.stdin):
  first_line = lines[0]
  if first_line in seen_errors:
    continue
  if ': error: ' in first_line or ': fatal error: ' in first_line:
    seen_errors.add(first_line)
    lines[0] = re.sub(
        r'([^/:]+):(\d+)',
        lambda match: '\033[91m%s\033[0m:\033[91m%s\033[0m' % (match.group(1), match.group(2)),
        first_line,
        count=1)
    print(''.join(lines))

print('Unique errors: %s' % len(seen_errors))