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

python -m cutplane_extract_core.cutplane_extract \
  --cut_selection "PIV2" \
  --output "Temp" \
  --nstart 10 \
  --mstart 0 \
  --max_file 1000 \
  --cut_style "plane" \
  --treatment "iso" \
  --isovar "Q" \
  --isovalue 2e6 \
  --mesh_path "/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/MESH_Fine_Dec25" \
  --mesh_file "Bombardier_10AOA_U50_Combine_Fine.mesh.h5" \
  --sol_dir "/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/RUN_Fine/SOLUT/" \
  --AoA 10

echo "Direct run of CutplaneExtract completed."

echo "Starting direct run of CutplaneExtract class with shell arguments..."

python -m cutplane_extract_core.cutplane_extract \
  --cut_selection "PIV3" \
  --output "Temp" \
  --nstart 10 \
  --mstart 0 \
  --max_file 1000 \
  --cut_style "plane" \
  --treatment "cut" \
  --isovar "Q" \
  --isovalue 2e6 \
  --restart \
  --mesh_path "/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/MESH_Fine_Dec25" \
  --mesh_file "Bombardier_10AOA_U50_Combine_Fine.mesh.h5" \
  --sol_dir "/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/RUN_Fine/SOLUT/" \
  --AoA 10
  
echo "Direct run of CutplaneExtract completed."

echo "Starting direct run of CutplaneExtract class with shell arguments..."

python -m cutplane_extract_core.cutplane_extract \
  --cut_selection "25mm_tip" \
  --output "Temp" \
  --nstart 10 \
  --mstart 0 \
  --max_file 1000 \
  --cut_style "plane" \
  --treatment "cut" \
  --isovar "Q" \
  --isovalue 2e6 \
  --restart \
  --mesh_path "/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/MESH_Fine_Dec25" \
  --mesh_file "Bombardier_10AOA_U50_Combine_Fine.mesh.h5" \
  --sol_dir "/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/RUN_Fine/SOLUT/" \
  --AoA 10
  
echo "Direct run of CutplaneExtract completed."

echo "Starting direct run of CutplaneExtract class with shell arguments..."

python -m cutplane_extract_core.cutplane_extract \
  --cut_selection "5mm_tip" \
  --output "Temp" \
  --nstart 10 \
  --mstart 0 \
  --max_file 1000 \
  --cut_style "plane" \
  --treatment "cut" \
  --isovar "Q" \
  --restart \
  --isovalue 2e6 \
  --mesh_path "/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/MESH_Fine_Dec25" \
  --mesh_file "Bombardier_10AOA_U50_Combine_Fine.mesh.h5" \
  --sol_dir "/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/RUN_Fine/SOLUT/" \
  --AoA 10
  
echo "Direct run of CutplaneExtract completed."