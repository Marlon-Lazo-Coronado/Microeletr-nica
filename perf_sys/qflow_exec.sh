#!/usr/bin/tcsh -f
#-------------------------------------------
# qflow exec script for project /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys
#-------------------------------------------

# /usr/lib/qflow/scripts/synthesize.sh /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys/source/area_sys.v || exit 1
# /usr/lib/qflow/scripts/placement.sh -d /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
# /usr/lib/qflow/scripts/opensta.sh  /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
# /usr/lib/qflow/scripts/vesta.sh -a /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
# /usr/lib/qflow/scripts/router.sh /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
# /usr/lib/qflow/scripts/opensta.sh  -d /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
# /usr/lib/qflow/scripts/vesta.sh -a -d /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
# /usr/lib/qflow/scripts/migrate.sh /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
/usr/lib/qflow/scripts/drc.sh /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
# /usr/lib/qflow/scripts/lvs.sh /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
# /usr/lib/qflow/scripts/gdsii.sh /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
# /usr/lib/qflow/scripts/cleanup.sh /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
# /usr/lib/qflow/scripts/display.sh /home/marlon/Escritorio/Protecto_part2_micro/src/perf_sys area_sys || exit 1
