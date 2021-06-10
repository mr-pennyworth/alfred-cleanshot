# -*- coding: utf-8 -*-

import os
import plistlib
import shutil
import subprocess

from contextlib import contextmanager


BUILD_DIR = 'wfbuild'
WF_FILES = [
  '1D8804FD-F9E6-457D-83D8-E3AEA432BA1E.png',
  '1FE4B488-8FF6-4E08-8781-B53953275FAE.png',
  '83D7B363-3BEB-49FF-94CA-CB1246A30F1D.png',
  'A7DE7A70-B3E2-4531-9509-01F3BF4FE2DC.png',
  'B0B38CAD-6949-4F11-9B8E-B53F7538F5EB.png',
  'E7E3A0BD-6513-455B-A6B5-0AB88A9C96B1.png',
  'icon.png',
  'icons',
  'info.plist',
  'pngpaste',
  'README.md',
]


def copy(filenames, dest_folder):
  if os.path.exists(dest_folder):
    shutil.rmtree(dest_folder)
  os.makedirs(dest_folder)

  for filename in filenames:
    if os.path.isdir(filename):
      shutil.copytree(filename, f'{dest_folder}/{filename}')
    else:
      shutil.copy(filename, f'{dest_folder}/{filename}')


def plistRead(path):
  with open(path, 'rb') as f:
    return plistlib.load(f)


def plistWrite(obj, path):
  with open(path, 'wb') as f:
    return plistlib.dump(obj, f)


@contextmanager
def cwd(dir):
  old_wd = os.path.abspath(os.curdir)
  os.chdir(dir)
  yield
  os.chdir(old_wd)

  
def make_export_ready(plist_path):
  wf = plistRead(plist_path)

  # remove noexport vars
  wf['variablesdontexport'] = []

  with open('README.md') as f:
    wf['readme'] = f.read()

  plistWrite(wf, plist_path)
  return wf['name']


if __name__ == '__main__':
  subprocess.call(['./build-scripts/mkapps.sh'])
  copy(WF_FILES, BUILD_DIR)
  wf_name = make_export_ready(f'{BUILD_DIR}/info.plist')
  with cwd(BUILD_DIR):
    subprocess.call(
      ['zip', '-q', '-r', f'../{wf_name}.alfredworkflow'] + WF_FILES
    )
