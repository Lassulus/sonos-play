import pysonos
import sys

controller = pysonos.SoCo(sys.argv[1])
controller.play_uri(sys.argv[2])
