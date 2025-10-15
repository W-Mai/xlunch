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

