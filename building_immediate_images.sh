set -e
build_opts="$@"

excluded_dirs() {
  for i in $(find . -maxdepth 1 -mindepth 1 -not -path *./.* -type d)
    do pushd $i > /dev/null &&

      local $1=${i#*/}
      [ -z $3 ] &&

        local imagename="${IMAGENAME_PREFIX}${name#*-}:${tag#*-}" &&
        docker build ${build_opts} --tag ${imagename} . &&
          docker push ${imagename}

      ${@:2}
    popd > /dev/null
  done
}

excluded_dirs name excluded_dirs tag