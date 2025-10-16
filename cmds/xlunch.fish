function xlunch --description 'bash envsetup.sh + lunch + export env'
    if not test -f build/envsetup.sh
        echo "Current directory is not a Vela project (build/envsetup.sh not found)." >&2
        return 1
    end

    bash -c "
        source build/envsetup.sh
        lunch $argv
        cat > .xenv.sh <<EOF
# Vela
export VELA_BUILD_TARGET_BOARD=\"\$VELA_BUILD_TARGET_BOARD\"
export VELA_BUILD_TARGET_VENDOR=\"\$VELA_BUILD_TARGET_VENDOR\"
export VELA_BUILD_TARGET_CONFIG=\"\$VELA_BUILD_TARGET_CONFIG\"
export CURRENT_LUNCH_BINARY_DIR=\"\$CURRENT_LUNCH_BINARY_DIR\"
export TARGET_BUILD_APPS=\"\$TARGET_BUILD_APPS\"
# Android
export TARGET_BUILD_TYPE=\"\$TARGET_BUILD_TYPE\"
export TARGET_BUILD_VARIANT=\"\$TARGET_BUILD_VARIANT\"
export TARGET_PRODUCT=\"\$TARGET_PRODUCT\"
export TARGET_RELEASE=\"\$TARGET_RELEASE\"
set_stuff_for_environment
EOF
    "
end

