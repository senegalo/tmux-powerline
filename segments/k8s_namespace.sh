run_segment() {
  cur_ctx=`kubectl config current-context`
  ns="$(kubectl config view -o=jsonpath="{.contexts[?(@.name==\"${cur_ctx}\")].context.namespace}")" \
    || exit_err "error getting current namespace"

  if [[ -z "${ns}" ]]; then
    echo "default"
  else
    echo "${ns}"
  fi
  exit 0
}
