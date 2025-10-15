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

