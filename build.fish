#!/usr/bin/env fish
set -l OUT (pwd)/install.fish
printf '#!/usr/bin/env fish\n# Auto-generated file, DO NOT EDIT\n' > $OUT
for src in cmds/*.fish
    test -f $src; or continue
    cat $src >> $OUT
    printf '\nfuncsave %s 2>/dev/null; or true\n' (basename $src .fish) >> $OUT
end
chmod +x $OUT

