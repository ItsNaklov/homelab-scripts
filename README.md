# homelab-scripts

Bash scripts for operating a self-hosted Kubernetes homelab.

---

## Scripts

| Script | What it does |
|--------|-------------|
| `health-check.sh` | Checks if homelab services are up, prints colored status report |

## Usage

```bash
chmod +x health-check.sh
./health-check.sh
```

## Stack
- Bash
- Curl
- Kubernetes

## Takeaway
- Bash script structure and the shebang
- Variables and arrays
- Loops and conditionals
- HTTP status codes and curl
- Terminal Colours
- Linux file permission with chmod
