#!/bin/bash

create_vm() {
  local name=$1
  shift

  if multipass info "$name" >/dev/null 2>&1; then
      echo "$name already exists. Skip"
  else
      multipass launch 24.04 -n "$name" "$@"
  fi
}

create_vm "cp1" -c 2 -m 4G -d 20G --cloud-init cloud-config.yaml

create_vm "worker1" -c 4 -m 8G -d 50G --cloud-init cloud-config.yaml
create_vm "worker2" -c 4 -m 8G -d 50G --cloud-init cloud-config.yaml

echo ""
echo "cp1 IP: $(multipass info cp1 --format csv | tail -n 1 | cut -d, -f3)"
echo "worker1 IP: $(multipass info worker1 --format csv | tail -n 1 | cut -d, -f3)"
echo "worker2 IP: $(multipass info worker2 --format csv | tail -n 1 | cut -d, -f3)"