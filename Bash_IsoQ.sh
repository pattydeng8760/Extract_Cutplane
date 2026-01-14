#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=192
#SBATCH --time=0-02:00
#SBATCH --job-name=Cut_Plane
#SBATCH --mail-user=patrickgc.deng@mail.utoronto.ca
#SBATCH --mail-type=ALL
#SBATCH --account=rrg-plavoie

source /project/rrg-plavoie/Env/avbp_py_env.sh
use_py_tools
export PYTHONPATH="/scratch/denggua1/Bombardier_LES/B_10AOA_U50_LES/Isosurface/Extract_Cutplane_Fine:$PYTHONPATH"

echo "Starting direct run of CutplaneExtract class with shell arguments..."

python -m cutplane_extract_core.cutplane_extract\
  --cut_selection "PIV1" \
  --output "Temp" \
  --nstart 8 \
  --mstart 0 \
  --max_file 300 \
  --cut_style "plane" \
  --treatment "iso" \
  --isovar "Q" \
  --isovalue 2e6 \
  --mesh_path "/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/MESH_Fine_Dec25" \
  --mesh_file "Bombardier_10AOA_U50_Combine_Fine.mesh.h5" \
  --sol_dir "/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/RUN_Fine/SOLUT/" \
  --AoA 10

echo "Direct run of CutplaneExtract completed."