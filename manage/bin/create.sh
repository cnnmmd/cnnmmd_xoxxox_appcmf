#!/bin/bash

pthtop="$(cd "$(dirname "${0}")/../../../.." && pwd)"
source "${pthtop}"/manage/lib/params.sh
source "${pthtop}"/manage/lib/shared.sh
source "${pthcrr}"/params.sh

pthapp="${pthsrc}"/appcmf
srccmf='https://github.com/comfyanonymous/ComfyUI.git'
pkgnod='comfyui_xoxxox_cnnmmd'
srcnod="https://github.com/cnnmmd/${pkgnod}"

test -d "${pthapp}" || mkdir "${pthapp}"

if test -d "${pthapp}"/ComfyUI
then
  cd "${pthapp}"/ComfyUI ; git pull
else
  cd "${pthapp}" ; git clone --depth 1 ${srccmf}
fi

if test -d "${pthapp}"/ComfyUI/custom_nodes/${pkgnod}
then
  cd "${pthapp}"/ComfyUI/custom_nodes/${pkgnod} && git pull
else
  cd "${pthapp}"/ComfyUI/custom_nodes && git clone ${srcnod}
  cd "${pthapp}"/ComfyUI/custom_nodes/${pkgnod}
  cp -p lib/params_cmf_sample.py lib/params_cmf.py
  cp -p lib/params_tlk_sample.py lib/params_tlk.py
  cp -p web/lib/params_tlk_sample.js web/lib/params_tlk.js
fi

addimg ${imgtgt} "${cnfimg}" "${pthdoc}"
