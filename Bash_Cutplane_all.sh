#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=192
#SBATCH --time=0-23:59
#SBATCH --job-name=Cut_5mm
#SBATCH --mail-user=patrickgc.deng@mail.utoronto.ca
#SBATCH --mail-type=ALL
#SBATCH --account=rrg-plavoie

timestamp() { date +"%F %T"; }
log() { echo "[$(timestamp)] $*"; }

# --- Environment ---
source /project/rrg-plavoie/Env/avbp_py_env.sh
use_py_tools

# --- Configuration (edit here) ---
BASE_PY="/scratch/denggua1/Bombardier_LES/B_10AOA_U50_LES/Isosurface/Extract_Cutplane_Fine"
export PYTHONPATH="${BASE_PY}:${PYTHONPATH:-}"

MESH_PATH="/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/MESH_Fine_Dec25"
MESH_FILE="Bombardier_10AOA_U50_Combine_Fine.mesh.h5"
SOL_DIR="/project/rrg-moreaust-ac/denggua1/Bombardier_LES/B_10AOA_U50/RUN_Fine/SOLUT/"

OUT_ROOT="Temp"
NSTART=8
MSTART=0
MAX_FILE=900
CUT_STYLE="plane"
ISOVAR="Q"
ISOVALUE="2e6"
AOA=10
RESTART_FLAG="--restart"   # set to "--restart" to enable, sete to "" to disable restart
VGT_FLAG="--VGT"       # set to "--VGT" to enable VGT processing, set to "" to disable

# --- Shared args (avoid repetition) ---
COMMON_ARGS=(
  --output "${OUT_ROOT}"
  --nstart "${NSTART}"
  --mstart "${MSTART}"
  --max_file "${MAX_FILE}"
  --cut_style "${CUT_STYLE}"
  --isovar "${ISOVAR}"
  --isovalue "${ISOVALUE}"
  --mesh_path "${MESH_PATH}"
  --mesh_file "${MESH_FILE}"
  --sol_dir "${SOL_DIR}"
  --AoA "${AOA}"
)

run_cut() {
  local cut_selection="$1"
  local treatment="$2"

  log "Running cut_selection='${cut_selection}' treatment='${treatment}'"

  # Optional: separate outputs per cut to avoid overwriting
  mkdir -p "${OUT_ROOT}/${cut_selection}"

  python -m cutplane_extract_core.cutplane_extract \
    --cut_selection "${cut_selection}" \
    --treatment "${treatment}" \
    --output "${OUT_ROOT}/${cut_selection}" \
    ${RESTART_FLAG} \
    ${VGT_FLAG} \
    "${COMMON_ARGS[@]/--output "${OUT_ROOT}"/}"  # drop the root output from COMMON_ARGS (we set per-cut output above)

  log "Done cut_selection='${cut_selection}'"
}

# --- Runs ---

# run_cut "PIV1"      "cut"
# run_cut "PIV2"      "cut"
# run_cut "PIV3"      "cut"
#run_cut "030_TE"      "cut"
# run_cut "085_TE"      "cut"
# run_cut "095_TE"      "cut"
# run_cut "midspan"   "cut"
#run_cut "25mm_tip"  "cut"
run_cut "5mm_tip"   "cut"


log "All cutplane extractions completed."