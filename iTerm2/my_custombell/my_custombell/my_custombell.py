#!/usr/bin/env python3.8

import iterm2
import os
from playsound import playsound
import time

# Change this to suit your preference
PATH_TO_SOUND_FILE = os.path.expanduser("~/ding.mp3")

def ding(last=[0.0]):
    now = time.perf_counter()
    if now - last[0] > 1:
        playsound(PATH_TO_SOUND_FILE)
    last[0] = now

async def main(connection):
    async def watch(session_id):
        async with iterm2.VariableMonitor(
            connection,
            iterm2.VariableScopes.SESSION,
            "bellCount",
            session_id) as mon:
          while True:
              new_value = await mon.async_get()
              try:
                  ding()
              except Exception as e:
                  print(f'Exception {e}')


    app = await iterm2.async_get_app(connection)
    await (iterm2.EachSessionOnceMonitor.
            async_foreach_session_create_task(app, watch))

iterm2.run_forever(main)