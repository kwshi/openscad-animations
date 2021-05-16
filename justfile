readme-header := '''
  # OpenSCAD animations
  
  A collection of animations I made in OpenSCAD to visualize geometric concepts
  encountered in math and physics.
'''

readme-top:
  #!/bin/bash
  set -euo pipefail
  echo '{{readme-header}}'
  find -name 'main.scad' \
  | while read -r scad; do
      path=${scad#./}
      dir=${path%/*}
      img=$dir/small.gif

      echo '> [**`'"$dir"'`**]('"$dir) –"
      sed -e '/^$/,$ d' -e 's|^// |> |' "$scad"
      echo '>'
      [[ -e $img ]] && echo "> ![$dir]($img)"
    done
