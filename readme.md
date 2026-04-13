# abrosimov-platform-ops

## Запуск
1. Создать ssh-ключ:
    ```shell
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_ansible -C "ansible_key"
    ```
2. Прописать public-key в `cloud-config.yaml`
    ```shell
    cat ~/.ssh/id_ed25519_ansible.pub
    ```
3. Поднять VMs:
    ```shell
    ./multipass_launch.sh
    ```
4. Прописать адреса VMs в `environments/dev/inventory.yml`
5. Запустить playbook:
    ```shell
    ansible-playbook -i environments/dev/inventory.yml playbooks/setup-k8s.yml
    ```
