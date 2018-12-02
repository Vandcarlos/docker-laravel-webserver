Fix permission to container access projects folder

```bash
sudo chcon -Rt svirt_sandbox_file_t ~/Code
```
