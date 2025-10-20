# Dual-Reference Pangenome Structural-Variant Analysis Pipeline (DR-PanSV)

**DR-PanSV** is a comparative workflow for *dual-reference* variant discovery.  
It performs read mapping against both **linear (GRCh38)** and **graph-based (pangenome)** references,  
followed by **small-variant (SNV/INDEL)** and **structural-variant (SV)** calling using  
**DeepVariant**, **Manta**, and **vg-call**.

This pipeline enables direct comparison between graph-based and linear reference analyses,  
producing both alignment files and corresponding VCF outputs for SNVs and SVs.

---

## 🧬 Key Features
- Dual read mapping: graph-based (pangenome) and linear reference alignment  
- Integrated small-variant and structural-variant discovery  
- Modular design using **CWL** and **Singularity** for reproducibility  
- Compatible with large-scale genomic workflows on HPC environments  

---

## 🧩 Installation Requirements

| Dependency | Minimum Version | Notes |
|-------------|-----------------|-------|
| [Singularity](https://sylabs.io/singularity) | ≥ 3.9.7 | Container execution |
| [cwltool](https://github.com/common-workflow-language/cwltool) | ≥ 3.1.2 | CWL workflow runner |

Clone this repository:
```bash
git clone https://github.com/YaungLiu/DR-PanSV.git
cd DR-PanSV
```

---

## ⚙️  Example Usage

### ▶️  Run pangenome-based variant calling
```bash
cwltool --singularity --tmpdir-prefix tmp pangenome_dv_vg_manta_wf/main-vg.cwl config/KSA_SRR29147641.json
```

### ▶️  Run linear-reference variant calling
```bash
cwltool --singularity --tmpdir-prefix tmp linear_dv_manta_wf/main.cwl config/hg38_SRR29147641.json
```
---

### 🧠 Customize Input Configuration

Modify the JSON files in the `config/` directory to specify:

- Input **FASTQ** read files  
- Reference genome paths (linear or pangenome graph)  
- Output directories and parameters

---

### 📁 Output Overview

Running **DR-PanSV** produces:

- **Graph-based alignments (CRAM)** from pangenome mapping  
- **Linear alignments (CRAM)** from GRCh38 mapping  
- **SNV/INDEL calls** from *DeepVariant*  
- **Structural variant (SV) calls** from *Manta* and *vg-call*  
- Optional **QC and summary statistics** (from *samtools* modules)

---

### 🧠 Citation

If you use **DR-PanSV** in your research, please cite:

> Liu Y., Li H.  
> *Dual-Reference Pangenome Structural-Variant Analysis Pipeline (DR-PanSV)*, 2025.  
> [https://github.com/YaungLiu/DR-PanSV](https://github.com/YaungLiu/DR-PanSV)

---

### 📄 License

This repository is distributed under the **MIT License**.
See the [LICENSE](LICENSE) file for details.

