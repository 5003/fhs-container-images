set -e
build_opts="$@"

excluded_dirs() {
  for i in $(find . -maxdepth 1 -mindepth 1 -not -path *./.* -type d)
    do pushd $i > /dev/null &&

      export $1=${i#*/}
      [ -z $3 ] &&

        export name=${IMAGENAME_PREFIX}${name}
        docker build ${build_opts} --tag ${name}:${tag} . &&
          echo -e "Build succeeded: $PWD\n"

      ${@:2}
    popd > /dev/null
  done
}

excluded_dirs name excluded_dirs tag