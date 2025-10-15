#!/usr/bin/env fish
# Auto-generated file, DO NOT EDIT
function xlunch --description 'bash envsetup.sh + lunch + export env'
    if not test -f build/envsetup.sh
        echo "Current directory is not a Vela project (build/envsetup.sh not found)." >&2
        return 1
    end

    bash -c "
        source build/envsetup.sh
        lunch $argv
        cat > .xenv.sh <<EOF
export VELA_BUILD_TARGET_BOARD=\"\$VELA_BUILD_TARGET_BOARD\"
export VELA_BUILD_TARGET_VENDOR=\"\$VELA_BUILD_TARGET_VENDOR\"
export VELA_BUILD_TARGET_CONFIG=\"\$VELA_BUILD_TARGET_CONFIG\"
export CURRENT_LUNCH_BINARY_DIR=\"\$CURRENT_LUNCH_BINARY_DIR\"
export TARGET_BUILD_APPS=\"\$TARGET_BUILD_APPS\"
EOF
    "
end


funcsave xlunch 2>/dev/null; or true
function xm --description 'envsetup.sh m'
    set -l xenv (pwd)/.xenv.sh
    if test -f $xenv
        bash -c "
            source build/envsetup.sh
            source $xenv
            m $argv
        "
    else
        echo 'ERROR: Please run `xlunch` first' >&2
        return 1
    end
end


funcsave xm 2>/dev/null; or true
