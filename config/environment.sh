#!/bin/bash

export subcmd_config="config"
export config_option_change_name="--change-name"

export subcmd_setup="setup"
export setup_option_ios_env="--ios-env"
export setup_option_ios_proj="--ios-proj"

export subcmd_build="build"
export build_option_ios_bugly="--ios-bugly"
export build_option_ios_jenkins="--ios-jenkins"
export build_option_ios_build="--ios-build"

export subcmd_review="review"
export review_option_submit_gerrit="--submit-gerrit"
export review_option_init_git="--init-git"

export subcmd_tools="tools"
export tools_option_convert_color="--convert-color"
export tools_option_convert_time="--convert-time"

subcmds="
  $subcmd_config
  $subcmd_setup
  $subcmd_build
  $subcmd_review
  $subcmd_tools
  "

 config_options="
  $config_option_change_name
"
setup_options="
  $setup_option_ios_env
  $setup_option_ios_proj
"
build_options="
  $build_option_ios_bugly
  $build_option_ios_jenkins
  $build_option_ios_build
"
review_options="
  $review_option_submit_gerrit
  $review_option_init_git
"
tools_options="
  $tools_option_convert_color
  $tools_option_convert_time
"

