import subprocess


def get_downstream_branches():
  current_branch = subprocess.check_output(['git', 'current-branch']).strip()
  other_branches = [branch.strip() for branch in subprocess.check_output(['git', 'branch']).split('\n') if branch and not branch.startswith('*')]
  return [branch for branch in other_branches if subprocess.check_output(['git', 'config', 'branch.' + branch + '.merge']) == 'refs/heads/%s\n' % current_branch]
