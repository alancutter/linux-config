import sys

def look_ahead(n, source_iter):
  buffer = []
  for x in source_iter:
    buffer.append(x)
    if len(buffer) > n:
      buffer.pop(0)
    if len(buffer) == n:
      yield tuple(buffer)

seen_errors = set()

for lines in look_ahead(3, sys.stdin):
  first_line = lines[0]
  if first_line in seen_errors:
    continue
  if ': error: ' in first_line or ': fatal error: ' in first_line:
    seen_errors.add(first_line)
    print(''.join(lines))
