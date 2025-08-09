# Bachelor Thesis Project

## Implementation Repositories

### Infrastructure
[BachelorThesis_Infra](https://github.com/MysterionAutotronic/BachelorThesis_Infra)

### Dashboard Frontend
[BachelorThesis_DashboardFE](https://github.com/MysterionAutotronic/BachelorThesis_DashboardFE)

### Dashboard Backend
[BachelorThesis_DashboardBE](https://github.com/MysterionAutotronic/BachelorThesis_DashboardBE)

### Tenant Frontend
[BachelorThesis_TenantFE](https://github.com/MysterionAutotronic/BachelorThesis_TenantFE)

### Tenant Backend
[BachelorThesis_TenantFE](https://github.com/MysterionAutotronic/BachelorThesis_TenantBE)

### ConfigSchema
[BachelorThesis_ConfigSchema](https://github.com/MysterionAutotronic/BachelorThesis_ConfigSchema)

## Scripts

### Make Glossary
```sh
makeglossaries thesis
```

### Crop PDF
```sh
pdfcrop input.pdf output.pdf
```

<details>

<summary><strong>bash</strong></summary>

### Setup
```sh
sudo bash ./scripts/install.sh
```

### Create plain text file

```sh
bash ./scripts/pandoc.sh
```

### Run JabRef

```sh
bash ./scripts/jabref.sh
```

### Compile SVG to PDF

```sh
bash ./scripts/convert_svgs.sh
```

</details>

<details>

<summary><strong>zsh</strong></summary>

### Setup

```sh
sudo zsh ./scripts/install.sh
```

### Create plain text file

```sh
zsh ./scripts/pandoc.sh
```

### Run JabRef

```sh
zsh ./scripts/jabref.sh
```

### Compile SVG to PDF

```sh
zsh ./scripts/convert_svgs.sh
```

</details>

## Linting

Add this to VSCode user settings (JSON) to avoid false positives for duplicate labels

```json
"latex-workshop.check.duplicatedLabels.enabled": false
```
