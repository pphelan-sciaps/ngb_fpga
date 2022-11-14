# imports
from pathlib import Path
from vunit import VUnit

# source and tb paths
ROOT = Path(__file__).resolve().parent
DUT_PATH = ROOT / "src"
TEST_PATH = ROOT / "test"
WAVE_FILE = "waves/wave.do"
FILE_EXT = "*.vhd"

# create vunit instance
VU = VUnit.from_argv()
VU.enable_location_preprocessing()

# design library and files
ngb_lib = VU.add_library("ngb_lib")
ngb_lib.add_source_files([DUT_PATH / FILE_EXT])

# testbench library and files
tb_lib = VU.add_library("tb_lib")
tb_lib.add_source_files([TEST_PATH / FILE_EXT])

# wave file
VU.set_sim_option("modelsim.init_file.gui", WAVE_FILE)

# run
VU.main()