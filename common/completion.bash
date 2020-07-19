#!/usr/bin/env bash

source $MINI_ROOT/common/environment.sh

_mini_completions() {
  local pre cur length
  COMPREPLY=()
  pre=${COMP_WORDS[COMP_CWORD - 1]}
  cur=${COMP_WORDS[COMP_CWORD]}
  length=${#COMP_WORDS[@]}

  # select suboptions for options
  case "$pre" in
    # config --change-name
    $config_option_change_name)
      COMPREPLY=($(compgen -A file))
      return 0
      ;;
    # setup --ios-env
    $setup_option_ios_env)
      COMPREPLY=($(compgen -A file))
      return 0
      ;;
    # setup --ios-proj
    $setup_option_ios_proj)
      COMPREPLY=($(compgen -A file))
      return 0
      ;;
    # build --ios-bugly
    $setup_option_ios_proj)
      COMPREPLY=($(compgen -A file))
      return 0
      ;;
    # setup --ios-jenkins
    $setup_option_ios_proj)
      COMPREPLY=($(compgen -A file))
      return 0
      ;;
    # setup --ios-build
    $setup_option_ios_proj)
      COMPREPLY=($(compgen -A file))
      return 0
      ;;
    # review --submit-gerrit
    $review_option_submit_gerrit)
      COMPREPLY=($(compgen -A file))
      return 0
      ;;
    # review --init-git
    $review_option_init_git)
      COMPREPLY=($(compgen -A file))
      return 0
      ;;
    # tools --convert-time
    $tools_option_convert_time)
      COMPREPLY=($(compgen -W "$convert_time_subopts" -- $cur))
      return 0
      ;;
    # tools --convert-color
    $tools_option_convert_color)
      COMPREPLY=($(compgen -A file))
      return 0
      ;;
  esac
  
  # select options for subcmd
  case "$pre" in
    $subcmd_config)
      COMPREPLY=($(compgen -W "$config_options" -- $cur))
      return 0
      ;;
    $subcmd_setup)
      COMPREPLY=($(compgen -W "$setup_options" -- $cur))
      return 0
      ;;
    $subcmd_build)
      COMPREPLY=($(compgen -W "$build_options" -- $cur))
      return 0
      ;;
    $subcmd_review)
      COMPREPLY=($(compgen -W "$review_options" -- $cur))
      return 0
      ;;
    $subcmd_tools)
      COMPREPLY=($(compgen -W "$tools_options" -- $cur))
      return 0
      ;;
  esac
  
  # select subcmds for mini
  case "$pre" in
    $MINI_NAME)
      COMPREPLY=($(compgen -W "$subcmds" -- $cur))
      return 0
      ;;
  esac
}

_testa() {
  local pre cur opts

  COMPREPLY=()
  pre=${COMP_WORDS[COMP_CWORD - 1]}
  cur=${COMP_WORDS[COMP_CWORD]}
  opts="-f -r -t -w -o --output -v --version -h --help"
  case "$cur" in
    -*)
      COMPREPLY=($(compgen -W "$opts" -- $cur))
  esac
}

_testb() {
  local pre cur
  COMPREPLY=()
  pre=${COMP_WORDS[COMP_CWORD - 1]}
  cur=${COMP_WORDS[COMP_CWORD]}
  
  complete_options() {
    local opts i
    opts="-f -r -t -w -o --output -v --version -h --help"
    for i in "${COMP_WORDS[@]}"
    do
      if [ "$i" == "-f" -o "$i" == "-r" ]; then
        opts="$opts"" -R -S --filter -p"
        break
      fi
    done

    for i in "${COMP_WORDS[@]}"
    do
      if [ "$i" == "-t" -o "$i" == "-w" ]; then
        opts="$opts"" -S --template --toc"
        break
      fi
    done
    echo "$opts"
  }

  case "$cur" in
    -*)
      COMPREPLY=($(compgen -W "$(complete_options)" -- $cur))
  esac
}

_testc() {
    local pre cur

    COMPREPLY=()
    #pre="$3"
    #cur="$2"
    pre=${COMP_WORDS[COMP_CWORD-1]}
    cur=${COMP_WORDS[COMP_CWORD]}
    READ_FORMAT="native json markdown markdown_strict markdown_phpextra 
    markdown_github textile rst html docbook opml mediawiki haddock latex"
    WRITE_FORMAT="native json plain markdown markdown_strict 
    markdown_phpextra markdown_github rst html html5 latex beamer context 
    man mediawiki textileorg textinfo opml docbook opendocument odt docx 
    rtf epub epub3 fb2 asciidoc slidy slideous dzslides revealjs s5"

    case "$pre" in
    -f|-r )
        COMPREPLY=( $( compgen -W "$READ_FORMAT" -- $cur ) )
        return 0
        ;;
    -t|-w )
        COMPREPLY=( $( compgen -W "$WRITE_FORMAT" -- $cur ) )
        return 0
    esac

    complete_options() {
        local opts i
        opts="-f -r -t -w -o --output -v --version -h --help"
        for i in "${COMP_WORDS[@]}"
        do
            if [ "$i" == "-f" -o "$i" == "-r" ]
            then
                opts="$opts"" -R -S --filter -p"
                break
            fi
        done

        for i in "${COMP_WORDS[@]}"
        do
            if [ "$i" == "-t" -o "$i" == "-w" ]
            then
                opts="$opts"" -s --template --toc"
                break
            fi
        done
        echo "$opts"
    }

    case "$cur" in
    -* )
        COMPREPLY=( $( compgen -W "$(complete_options)" -- $cur) )
        ;;
    * )
        COMPREPLY=( $( compgen -A file ))
    esac
}

complete -F _mini_completions $MINI_NAME
