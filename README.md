# workspace

服务器 B（软件所 `jiahao01-ubuntu-01`）上的代码实验工作区，同步到 GitHub。

## 目录约定

- `projects/` —— 每个实验一个子目录（例如 `projects/my-experiment/`）
- `notes/`    —— 笔记、踩坑记录、命令备忘

## 新增一个实验

```bash
cd ~/workspace
mkdir -p projects/新实验名 && cd projects/新实验名
# ...写代码...
cd ~/workspace
git add projects/新实验名
git commit -m "add 新实验名"
git push
```

## 为什么有些东西不进 git

见 `.gitignore`。关键几条：

- **`linux-*/`**：内核源码树（`damon-lab` 里的 `linux-7.2` 有数 GB），入库会让仓库爆炸。
  如果你要版本化内核改动，请只提交 **补丁文件**（`git format-patch` 的产物）或配置脚本。
- **`vmlinux.h`**：由 `bpftool btf dump` 生成，属构建产物。
- **`*.bpf.o` / `*.o` / `*.cpio.gz`**：编译产物。

## 远程仓库

首次推送前设置（把 `URL` 换成你的 GitHub 仓库地址）：

```bash
git remote add origin git@github.com:你的用户名/仓库名.git
git branch -M main
git push -u origin main
```

## 环境

已装：`python3 3.12`、`gcc 13.3`、`make 4.3`、`git 2.43`
未装：`node` / `npm` / `go` / `docker`（需要时告诉我装）
