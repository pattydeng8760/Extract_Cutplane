#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --time=0-01:00
#SBATCH --job-name=Cut_Plane_25mm_tip
#SBATCH --mail-user=patrickgc.deng@mail.utoronto.ca
#SBATCH --mail-type=ALL
#SBATCH --account=rrg-plavoie

source /project/rrg-plavoie/Env/avbp_py_env.sh
use_py_tools
export PYTHONPATH="/scratch/denggua1/Bombardier_LES/B_10AOA_U50_LES/PostProc_Medium/Extract_Cutplane:$PYTHONPATH"

echo "Starting direct run of CutplaneExtract class with shell arguments..."

python -m cutplane_extract_core.cutplane_extract \
  --cut_selection "PIV3" \
  --output "Temp" \
  --nstart 3 \
  --mstart 0 \
  --max_file 1000 \
  --cut_style "plane" \
  --treatment "iso" \
  --isovar "Q" \
  --isovalue 2e6 \
  --mesh_path "/scratch/denggua1/Bombardier_LES/B_10AOA_U50_LES/MESH_Medium_Aug25" \
  --mesh_file "Bombardier_10AOA_U50_Combine_Medium.mesh.h5" \
  --sol_dir "/scratch/denggua1/Bombardier_LES/B_10AOA_U50_LES/RUN_Medium/SOLUT/" \
  --AoA 10

echo "Direct run of CutplaneExtract completed."